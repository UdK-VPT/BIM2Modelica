# -*- coding: utf-8 -*-
#
import ifcopenshell
import ifcopenshell.geom

import libdm.BuildingDataModel as bdm
import libdm.DataModelGenerator as dmg
import IfcLib.Ifc2x3Lib as ifcLib
from IfcLib import DataClasses
import math
import re
import os

def cmp(a, b):
    '''
    Compares a and b and returns -1 if a < b, 0 if a == b and 1 if a > b
    '''
    return (a > b) - (a < b)

def azimuthAngle(x,y,z):
    '''
    returns the azimuth angle of a vector
    '''
    if x == 0.0 and y == 0.0:
        return 0.0
    if y < 0 and x == 0:
        return math.acos(y*1.0/math.sqrt(x*x+y*y))/math.pi*180.0
    else:
        return math.acos(y*1.0/math.sqrt(x*x+y*y))/math.pi*180.0*cmp(x,0)

def tiltAngle(x,y,z):
    '''
    returns the tilt angle of a vector
    '''
    return math.acos(z*1.0/math.sqrt(x*x+y*y+z*z))/math.pi*180.0

def mapIFCtoBuildingDataModel(file,filename):
    '''
    Analyses the IFC file regarding the information, which defines
    the building zones and the building elements and maps it to the
    building data model
    '''
    settings = ifcopenshell.geom.settings()
    settings.set(settings.USE_PYTHON_OPENCASCADE, True)

    # Elements need two representations (SweptSolid and Curve2D). If those are not present,
    # it is likely that the building element has childrens containing the necessary representations.
    # Elements/Walls with one representation will throw an error when calling create_shape().
    # This problem appeared for some IfcWall with air gaps.
    # The IfcWall were composed by several "IfcBuildingElementPart" elements
    # which contain the necessary representations.
    # Here, the list all_walls obtained with file.by_type("IfcWall") is filtered. Removing the
    # elements with less than 2 Representations.
    all_walls = file.by_type("IfcWall")
    originalWalls = []
    walls = []
    walls_decomposed = []
    for w in all_walls:
        shape_tup = ifcopenshell.geom.create_shape(settings, w)
        toposhape = shape_tup.geometry
        mesh = DataClasses.Mesh(toposhape)
        originalWalls.append(mesh)
        if len(w.Representation.Representations) >= 2:
            walls.append([w, toposhape])
        else:
            walls_decomposed.append(w)

    # Add element parts of IfcWall with one representation to the "walls" list
    # walls includes ifcWall (incl. IfcWallStandardCase, ...)
    # and ifcBuildingElementPart elements.
    BuildingElementPart = file.by_type("IfcBuildingElementPart")
    for be in BuildingElementPart:
        walls.append([be, ifcopenshell.geom.create_shape(settings, be).geometry])

    all_doors = file.by_type("IfcDoor")
    originalDoors = []
    for d in all_doors:
        shape_tup = ifcopenshell.geom.create_shape(settings, d)
        toposhape = shape_tup.geometry
        mesh = DataClasses.Mesh(toposhape)
        originalDoors.append(mesh)

    # Slabs and Colums are not filtered, but stored using the same data structure
    # that was used for the walls: [Ifc element, shape]
    all_slabs = file.by_type("IfcSlab")
    originalSlabs = []
    slabs = []
    for s in all_slabs:
        shape_tup = ifcopenshell.geom.create_shape(settings, s)
        toposhape = shape_tup.geometry
        mesh = DataClasses.Mesh(toposhape)
        originalSlabs.append(mesh)
        slabs.append([s, ifcopenshell.geom.create_shape(settings, s).geometry])

    all_columns = file.by_type("IfcColumn")
    originalColumns = []
    columns = []
    for c in all_columns:
        shape_tup = ifcopenshell.geom.create_shape(settings, c)
        toposhape = shape_tup.geometry
        mesh = DataClasses.Mesh(toposhape)
        originalColumns.append(mesh)
        columns.append([c, ifcopenshell.geom.create_shape(settings, c).geometry])

    all_windows = file.by_type("IfcWindow")
    originalWindows = []
    for w in all_windows:
        shape_tup = ifcopenshell.geom.create_shape(settings, w)
        toposhape = shape_tup.geometry
        mesh = DataClasses.Mesh(toposhape)
        originalWindows.append(mesh)

    # Dictionary with key name of Ifc element (IfcWall, ...) containg a list of the element-id which
    # for some reason (i.e. wrong definition, too complex, ...) should be disregarded.
    black_list = {}
    # Main programm:
    # 1.Check Ifc file
    # Search for spaces overlapping with building elements and correct them
    # overlappedId,overlappedShape = ifcLib.getOverlappedelements(ifc_file)
    # get black list of spaces by adding spaces (Id) of redundand spaces
    black_list["IfcSpace"] = ifcLib.getOverlappedSpaces(file)
    # Search for wrong defined IfcSpaces that do not fill a whole space/room
    # (gap between building elements and IfcSpace) and correct them
    # 2.Obtain information
    # Definition of the building constructions
    MaterialLayerset = ifcLib.LayerSet_toLayers(file)
    # Definition of the constructions and combination with the building elements
    BuildingElementToMaterialLayerSet, BuildingElementToMaterial = ifcLib.BuildingElement_toMaterialLayer(file)
    # Building element dictionaries
    WindowToStyle, DoorToStyle = ifcLib.WindowAndDoor_toStyle(file)
    WallInfo, problematicWalls = ifcLib.getWallInfo(walls)
    SlabsInfo = ifcLib.getSlabInfo(slabs)
    ColumnsInfo = ifcLib.getColumninfo(columns)
    # Definition of the building site
    Site = file.by_type("IfcSite")
    # Instantiation of SpaceContainer using Spaces Volumes
    SpacesW, Spaces = ifcLib.initSpaceContainer(file, black_list["IfcSpace"])
    # Find contacts between space boundaries (from space volume) and IfcWalls
    SpacesW, black_list["IfcWall"], black_list["IfcSlab"] = ifcLib.RelatedElementsWalls(SpacesW, file, WallInfo, SlabsInfo)
    # Modify SpaceContainer accordingly with Walls information.
    SpacesW = ifcLib.SecondLvLBoundariesWalls(SpacesW, WallInfo, SlabsInfo)
    # Remove any boundary attached to a IfcWall of the previously initialized SpaceContainer list -Spaces-
    Spaces = ifcLib.SpaceBoundariesWithoutWalls(Spaces, SpacesW)
    # Find relation/contact between IFC classes (openings,slabs,.. even spaces)
    # to boundaries of each SpaceContainer within Spaces.
    Spaces, OpeningsDict, giv = ifcLib.RelatedElements(Spaces, file, WallInfo, ColumnsInfo)
    # Dictionary Spaces.RelatedOpening is checked. Removing/filtering boundary definitions in excess.
    Spaces = ifcLib.OverlappedOpenings(Spaces)
    #
    Spaces = ifcLib.addVirtualBoundaries(Spaces)
    # Update SpaceContainer list Spaces. Editing boundaries based on connected/related IFC classes
    Spaces = ifcLib.SecondLvLBoundaries(Spaces, SpacesW, WallInfo, OpeningsDict, SlabsInfo, ColumnsInfo)
    # Als normals of the boundaries show to the ambient of a space
    Spaces = ifcLib.CorrectNormalVector(Spaces)
    # Analysis of the adjacent space (other space, ambient, other building element) and modification
    # of the correspodent boundaries
    Spaces = ifcLib.UpdateSecondLvLBoundaries(Spaces, WallInfo, ColumnsInfo, black_list["IfcWall"])
    Spaces = ifcLib.CorrectNormalVector(Spaces)
    #
    Spaces = ifcLib.ExploreSurroundings(Spaces)
    # Correct some of the 3rd level boundaries which OtherSideSpace is not properly defined ("unknown")
    # The definition of 3rd level boundaries is not working properly (failing for complex cases). Some code has
    # been commented out in - UpdateSecondLvLBoundaries -. Until improvements, to call CorrectThirdLevelBoundaries
    # is no further necessary
    # Spaces = ifcLib.CorrectThirdLevelBoundaries(Spaces, ifc_file, WallInfo, ColumnsInfo)
    # Estimation of all height and with for all boundaries
    Spaces = ifcLib.BoundariesHeightWidth(Spaces, WindowToStyle, DoorToStyle, file)
    # Get points of the profile of each boundary face (ignore points of gaps)
    Spaces = ifcLib.Profiles(Spaces)
    # Definition of all positions (spaces, elements)
    Spaces = ifcLib.DefinePosition(Spaces)
    # Add the id's of included space boundaries to their related space boundaries
    Spaces = ifcLib.StoreEnclosedBoundaries(Spaces, WallInfo, OpeningsDict)
    '''
    Instantiation and parameterisation of the building data model
    '''
    modelName = os.path.basename(filename).split('.')[0]
    # Remove invalid characters
    modelName = re.sub('[^0-9a-zA-Z_]', '', modelName)
    # Remove leading characters until a letter or underscore occurs
    modelName = re.sub('^[^a-zA-Z_]+', '', modelName)

    buildingData = bdm.Building(name=modelName, pos=(0.0,0.0,0.0))
    ico = 1
    treatedCon = {}

    ## Original walls
    for owa in originalWalls:
        buildingData.addOriginalWall(owa)

    ## Original doors
    for odo in originalDoors:
        buildingData.addOriginalDoor(odo)

    ## Original slabs
    for osl in originalSlabs:
        buildingData.addOriginalSlab(osl)

    ## Original slabs
    for owi in originalWindows:
        buildingData.addOriginalWindow(owi)

    ## Construction types
    for con in MaterialLayerset.items():
        thickness = []
        material = []
        treatedCon[con[0]] = "Construction"+str(ico)
        for layer in con[1]:
            if layer.Thickness > 1.0: # length unit in the IFC file in mm
                thickness.append(layer.Thickness/1000.0)
            else: # length unit in the IFC file in m
                thickness.append(layer.Thickness)
            material.append("BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete")
        buildingData.addConstruction(bdm.Construction(name="Construction"+str(ico),
                                                      numberOfLayers=len(con[1]),
                                                      thickness=thickness,
                                                      material=material))
        ico = ico + 1
    treatedBuildingEle = {}
    treatedZones = {}

    ## Thermal zones
    izo = 1
    for space in Spaces:
        treatedZones[space.Space.GlobalId] = "zone_" + str(izo)
        izo = izo + 1

    iwa = 1
    isl = 1
    ido = 1
    iwi = 1
    for space in Spaces:
        iel=0
        iwaz = 0
        islz = 0
        idoz = 0
        iwiz = 0
        heightMin = 0.0
        heightMax = 0.0
        ## Construction elements
        for bound in space.Boundaries:
            if bound.OtherSideSpace in treatedZones.keys() or bound.OtherSideSpace == "EXTERNAL":
                side1 =  treatedZones[space.Space.GlobalId]
                if bound.OtherSideSpace == "EXTERNAL":
                    side2 = "AMB"
                else:
                    side2 = treatedZones[bound.OtherSideSpace]

                ## Walls
                if bound.RelatedBuildingElement in WallInfo.keys() and bound.thickness[0] > 0.0:
                    iel = iel + 1
                    iwaz = iwaz + 1
                    if bound.OtherSideBoundary not in treatedBuildingEle.keys():
                        treatedBuildingEle[bound.Id] = "wall_"+str(iwa)
                        includedWindows = []
                        includedDoors = []
                        for b in space.Boundaries:
                            if b.Id in bound.IncludedBoundariesIds:
                                if b.RelatedBuildingElement in WindowToStyle.keys():
                                    includedWindows.append((b.Width,b.Height))
                                if b.RelatedBuildingElement in DoorToStyle.keys():
                                    includedDoors.append((b.Width,b.Height))
                        buildingData.addOpaqueElement(bdm.BuildingElementOpaque(id=bound.Id,
                                                                                name="wall_"+str(iwa),
                                                                                pos=(bound.Position.X(),bound.Position.Y(),bound.Position.Z()),
                                                                                angleDegAzi=azimuthAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                                angleDegTil=tiltAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                                adjZoneSide1=side1,
                                                                                adjZoneSide2=side2,
                                                                                width=bound.Width,
                                                                                height=bound.Height,
                                                                                areaNet=bound.Area,
                                                                                thickness=bound.thickness[0],
                                                                                constructionData=treatedCon[BuildingElementToMaterialLayerSet[bound.RelatedBuildingElement]],
                                                                                mesh=DataClasses.Mesh(bound.Face),
                                                                                includedWindows=includedWindows,
                                                                                includedDoors=includedDoors))
                        iwa = iwa + 1

                ## Slabs
                if bound.RelatedBuildingElement in SlabsInfo.keys() and tiltAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()) in [0.0,180.0]:
                    iel = iel + 1
                    islz = islz + 1
                    if bound.OtherSideBoundary not in treatedBuildingEle.keys():
                        treatedBuildingEle[bound.Id] = "slab_"+str(isl)
                        if bound.Position.Z() > heightMax:
                            heightMax = bound.Position.Z()
                        if bound.Position.Z() < heightMin:
                            heightMin = bound.Position.Z()
                        buildingData.addOpaqueElement(bdm.BuildingElementOpaque(id=bound.Id,
                                                                                name="slab_"+str(isl),
                                                                                pos=(bound.Position.X(),bound.Position.Y(),bound.Position.Z()),
                                                                                angleDegAzi=azimuthAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                                angleDegTil=tiltAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                                adjZoneSide1=side1,
                                                                                adjZoneSide2=side2,
                                                                                width=bound.Width,
                                                                                height=bound.Height,
                                                                                areaNet=bound.Area,
                                                                                thickness=bound.thickness[0],
                                                                                constructionData=treatedCon[BuildingElementToMaterialLayerSet[bound.RelatedBuildingElement]],
                                                                                mesh=DataClasses.Mesh(bound.Face),
                                                                                includedWindows=[],
                                                                                includedDoors=[]))
                        isl = isl + 1

                ## Doors
                if bound.RelatedBuildingElement in DoorToStyle.keys():
                    iel = iel + 1
                    idoz = idoz + 1
                    if bound.OtherSideBoundary not in treatedBuildingEle.keys():
                        mesh=DataClasses.Mesh(bound.Face)
                        treatedBuildingEle[bound.Id] = "door_"+str(ido)
                        buildingData.addDoorElement(bdm.BuildingElementDoor(id=bound.Id,
                                                                            name="door_"+str(ido),
                                                                            pos=(bound.Position.X(),bound.Position.Y(),bound.Position.Z()),
                                                                            angleDegAzi=azimuthAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                            angleDegTil=tiltAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                            adjZoneSide1=side1,
                                                                            adjZoneSide2=side2,
                                                                            width=bound.Width,
                                                                            height=bound.Height,
                                                                            areaNet=bound.Area,
                                                                            thickness=bound.thickness[0],
                                                                            constructionData="Construction1",
                                                                            mesh=DataClasses.Mesh(bound.Face)))
                        ido = ido + 1

                ## Transparent elements
                if bound.RelatedBuildingElement in WindowToStyle.keys():
                    iel = iel + 1
                    iwiz = iwiz + 1
                    if bound.OtherSideBoundary not in treatedBuildingEle.keys():
                        mesh=DataClasses.Mesh(bound.Face)
                        treatedBuildingEle[bound.Id] = "window_"+str(iwi)
                        buildingData.addTransparentElement(bdm.BuildingElementTransparent(id=bound.Id,
                                                                                          name="window_"+str(iwi),
                                                                                          pos=(bound.Position.X(),bound.Position.Y(),bound.Position.Z()),
                                                                                          angleDegAzi=azimuthAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                                          angleDegTil=tiltAngle(bound.Normal.X(),bound.Normal.Y(),bound.Normal.Z()),
                                                                                          adjZoneSide1=side1,
                                                                                          adjZoneSide2=side2,
                                                                                          width=bound.Width,
                                                                                          height=bound.Height,
                                                                                          areaNet=bound.Area,
                                                                                          thickness=bound.thickness[0],
                                                                                          mesh=DataClasses.Mesh(bound.Face)))
                        iwi = iwi + 1

        ## Thermal zones
        buildingData.addZone(bdm.BuildingZone(id=space.Space.GlobalId,
                                              name=treatedZones[space.Space.GlobalId],
                                              pos=(0.0,0.0,0.0),
                                              volume=space.Volume,
                                              height=abs(heightMax-heightMin),
                                              numberOfElements=iel,
                                              numberOfWalls=iwaz,
                                              numberOfSlabs=islz,
                                              numberOfDoors=idoz,
                                              numberOfWindows=iwiz,
                                              TSetHeating=20.0,
                                              TSetCooling=24.0,
                                              airchange=0.5,
                                              thermalLoads=0.0))
    return buildingData

def getGeneratorData(buildingData):
    '''
    Takes the information from the building data model and store it
    in the data model for the multizone building code generator
    '''

    ## Construction types
    constructions = []
    for con in buildingData.getParameter('constructions'):
        constructions.append(dmg.Construction(name=con.name,
                                              nLayers=con.numberOfLayers,
                                              thickness=con.thickness,
                                              material=con.material))

    ## Thermal zones
    zones = []
    for zone in buildingData.getParameter('zones'):
        zones.append(dmg.Zone(name=zone.name,
                              pos=(zone.pos.X(),zone.pos.Y(),zone.pos.Z()),
                              nElements=zone.numberOfElements,
                              nWalls=zone.numberOfWalls,
                              nSlabs=zone.numberOfSlabs,
                              nDoors=zone.numberOfDoors,
                              nWindows=zone.numberOfWindows,
                              volume=zone.volume,
                              height=zone.height,
                              TSetHeating=zone.TSetHeating,
                              TSetCooling=zone.TSetCooling,
                              airchange=zone.airchange,
                              heatsource=zone.thermalLoads))

    ## Opaque elements
    elementsOpaque = []
    for eleOpa in buildingData.getParameter('opaqueElements'):
        elementsOpaque.append(dmg.ElementOpaque(name=eleOpa.name,
                                                pos=(eleOpa.pos.X(),eleOpa.pos.Y(),eleOpa.pos.Z()),
                                                memberOfZone=[eleOpa.adjZoneSide1,eleOpa.adjZoneSide2],
                                                angleDegAzi=eleOpa.angleDegAzi,
                                                angleDegTil=eleOpa.angleDegTil,
                                                height=eleOpa.height,
                                                width=eleOpa.width,
                                                thickness=eleOpa.thickness,
                                                mesh=eleOpa.mesh,
                                                constructionData=eleOpa.constructionData,
                                                AInnSur=round(eleOpa.width*eleOpa.height-eleOpa.areaNet,3),
                                                includedWindows=eleOpa.includedWindows,
                                                includedDoors=eleOpa.includedDoors))

    ## Transparent elements
    elementsTransparent = []
    for eleTra in buildingData.getParameter('transparentElements'):
        elementsTransparent.append(dmg.ElementTransparent(name=eleTra.name,
                                                          pos=(eleTra.pos.X(),eleTra.pos.Y(),eleTra.pos.Z()),
                                                          memberOfZone=[eleTra.adjZoneSide1,eleTra.adjZoneSide2],
                                                          angleDegAzi=eleTra.angleDegAzi,
                                                          angleDegTil=eleTra.angleDegTil,
                                                          height=eleTra.height,
                                                          width=eleTra.width,
                                                          thickness=eleTra.thickness,
                                                          mesh=eleTra.mesh))

    ## Door elements
    elementsDoor = []
    for eleDoo in buildingData.getParameter('doorElements'):
        elementsDoor.append(dmg.ElementDoor(name=eleDoo.name,
                                            pos=(eleDoo.pos.X(),eleDoo.pos.Y(),eleDoo.pos.Z()),
                                            memberOfZone=[eleDoo.adjZoneSide1,eleDoo.adjZoneSide2],
                                            angleDegAzi=eleDoo.angleDegAzi,
                                            angleDegTil=eleDoo.angleDegTil,
                                            height=eleDoo.height,
                                            width=eleDoo.width,
                                            thickness=eleDoo.thickness,
                                            mesh=eleDoo.mesh,
                                            constructionData=eleDoo.constructionData,
                                            AInnSur=round(eleDoo.width*eleDoo.height-eleDoo.areaNet,3)))

    ## Element <-> zone
    conEleZon = []
    eleZoneRel = buildingData.getElementZoneRelations()
    for zone in eleZoneRel.keys():
        i = 1
        for con in eleZoneRel[zone]:
            conEleZon.append(dmg.ConnectionElementZone(element=con[0],
                                                       elementPort=con[1],
                                                       zone=zone,
                                                       zonePort=str(i)))
            i = i + 1

    ## Element <-> ambient
    conEleAmb = []
    eleAmbRel = buildingData.getElementAmbientRelations()
    i = 1
    for con in eleAmbRel:
        conEleAmb.append(dmg.ConnectionElementAmbient(element=con[0],
                                                      elementPort=con[1],
                                                      ambientPort=str(i)))
        i = i + 1

    ## Element <-> solid ambient
    conEleSol = []
    eleSolRel = buildingData.getElementGroundRelations()
    i = 1
    for con in eleSolRel:
        conEleSol.append(dmg.ConnectionElementSolid(element=con[0],
                                                    elementPort=con[1],
                                                    solidPort=str(i)))
        i = i + 1

    ## Building system
    buildingSystem = dmg.BuildingSystem(name=buildingData.getParameter('name'),
                                        location='BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII',
                                        originalWalls = buildingData.getParameter('originalWalls'),
                                        originalDoors = buildingData.getParameter('originalDoors'),
                                        originalSlabs = buildingData.getParameter('originalSlabs'),
                                        originalWindows = buildingData.getParameter('originalWindows'))

    return {'constructions':constructions,
            'zones':zones,
            'elementsOpaque':elementsOpaque,
            'elementsTransparent':elementsTransparent,
            'elementsDoor':elementsDoor,
            'conEleZon':conEleZon,
            'conEleAmb':conEleAmb,
            'conEleSol':conEleSol,
            'buildingSystem':buildingSystem}

def filter01(d, systemCfg, generatorCfg, logger):
    for fileName in d:
        fileData = d[fileName]
        logger.info('determine building model information for file: %s', fileName)
        dataModel = mapIFCtoBuildingDataModel(fileData['IfcData'], fileName)
        logger.info('determine generator data for file: %s', fileName)
        # insert additional data into the existing dictionary for this file,
        # using an underscore will minimize the risk of overwriting data read from the json file
        fileData['_buildingData'] = getGeneratorData(dataModel)
    print('ready')
