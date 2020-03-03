# -*- coding: utf-8 -*-

import math

import OCC.Core.Bnd
import OCC.Core.BRep
from OCC.Core.BRep import BRep_Builder, BRep_Tool
import OCC.Core.BRepAlgoAPI
import OCC.Core.BRepBndLib
import OCC.Core.BRepBuilderAPI
import OCC.Core.BRepExtrema
import OCC.Core.BRepGProp
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
import OCC.Core.BRepPrimAPI
import OCC.Core.BRepTools
import OCC.Core.Geom
import OCC.Core.GeomLib
import OCC.Core.GeomLProp
import OCC.Core.GProp
import OCC.Core.gp
import OCC.Core.ShapeAnalysis
import OCC.Core.TopAbs
from OCC.Core.TopAbs import TopAbs_FACE
from OCC.Core.TopLoc import TopLoc_Location
import OCC.Core.TopExp
from OCC.Core.TopExp import TopExp_Explorer
import OCC.Core.TopoDS
from OCC.Core.TopoDS import TopoDS_Compound, topods_Edge, TopoDS_Face, topods_Face

import ifcopenshell
import ifcopenshell.geom
import IfcLib.DataClasses

# Specify to return pythonOCC shapes from ifcopenshell.geom.create_shape()
settings = ifcopenshell.geom.settings()
settings.set(settings.USE_PYTHON_OPENCASCADE, True)


def BuildingElement_toMaterialLayer(ifc_file):
    """
    Returns two dictionaries
    where keys are GlobalId of building elements (IfcBeam, IfcSlab, IfcWall, ...)
    and value are "id" of either the Material (IfcMaterial) or the layer set (IfcMaterialLayerSet).
    """
    AssociatesMaterial = ifc_file.by_type("IfcRelAssociatesMaterial")
    BuildingElementToMaterialLayerSet = {}
    BuildingElementToMaterial = {}
    for am in AssociatesMaterial:
        if am.RelatingMaterial.is_a() == "IfcMaterialLayerSetUsage":
            BuildingElementToMaterialLayerSet[am.RelatedObjects[0].GlobalId] = am.RelatingMaterial.ForLayerSet.id()
        else:
            # It is illegal to assign an IfcMaterialLayerSetUsage to an IfcWall.
            # Only the subtype IfcWallStandardCase supports this concept.
            BuildingElementToMaterial[am.RelatedObjects[0].GlobalId] = am.RelatingMaterial.id()
    return BuildingElementToMaterialLayerSet, BuildingElementToMaterial


def LayerSet_toLayers(ifc_file):
    """
    Returns a dictionary where keys are the Id of the IfcMaterialLayerSet
    and where the values are a list (ListOfLayers) with an element per material layer.
    The material layer information is stored at the same time
    within a list containing Id (number), material and thickness
    """
    IfcLayerSet = ifc_file.by_type("IfcMaterialLayerSet")
    LayerSet = {}
    for ls in IfcLayerSet:  # ls.is_a() = IfcMaterialLayerSet
        ListOfLayers = []
        for ml in ls.MaterialLayers:  # ml.is_a() = IfcMaterialLayer
            currentLayer = IfcLib.DataClasses.Layer(ml.id(), ml.Material, ml.LayerThickness)
            ListOfLayers.append(currentLayer)
        LayerSet[ls.id()] = ListOfLayers
    return LayerSet


def WindowAndDoor_toStyle(ifc_file):
    """
    Some basic information such as height, width, construction type (Aluminium, ...)
    and Operation type (Single swing left, ...) is extracted from IfcWindowStyle and IfcDoorStyle
    and stored into two separate dictionaries, DoorToStyle and WindowToStyle.
    Their keys are the GlobalId of the corresponding building element (IfcDoor or IfcWindow).
    """
    DefinesByType = ifc_file.by_type("IfcRelDefinesByType")
    WindowToStyle = {}
    DoorToStyle = {}
    for dbt in DefinesByType:
        if dbt.RelatingType.is_a() == "IfcWindowStyle":
            for w in dbt.RelatedObjects:
                WindowToStyle[w.GlobalId] = [w.OverallHeight / 1000,
                                             w.OverallWidth / 1000,
                                             dbt.RelatingType.ConstructionType,
                                             dbt.RelatingType.OperationType]
        elif dbt.RelatingType.is_a() == "IfcDoorStyle":
            for d in dbt.RelatedObjects:
                DoorToStyle[d.GlobalId] = [d.OverallHeight / 1000,
                                           d.OverallWidth / 1000,
                                           dbt.RelatingType.ConstructionType,
                                           dbt.RelatingType.OperationType]
    return WindowToStyle, DoorToStyle


def ElementFaceToThickness(mylist):
    """
    The shapes of each ifc element of the input list are explored.
    Faces are extraced and iterated over the other faces.
    During the exp2.More() loop a parallel face is searched.
    If found thickness (distance between faces "BRepExtrema_ExtFF")
    and the normal vector are obtained.

    The dictionary "element_dict" is returned with key (Id of building element)
    and a dictionary as a value.
    The value/dictionary uses the face as a key and a list as a value.
    The value contains the thickness and the normal vector.

    Beware that,
        1. ExtFF.SquareDistance is for some cases reporting a distance = 0, when displaying these
            faces are clearly at a higher distance... not clear why it is happening.
        2. The function might fail for complex walls where more than one parallel face exist
            for some face.. It might be convinient to check if the at a certain distance parallel
            face found is the correct one.
    """
    props = OCC.Core.GProp.GProp_GProps()
    element_dict = {}
    problematicElement = []
    for element in mylist:
        shape = element[1]
        exp0 = OCC.Core.TopExp.TopExp_Explorer(shape, OCC.Core.TopAbs.TopAbs_SOLID)
        aux = {}
        while exp0.More():
            exp = OCC.Core.TopExp.TopExp_Explorer(exp0.Current(), OCC.Core.TopAbs.TopAbs_FACE)
            while exp.More():
                flag = False
                face1 = OCC.Core.TopoDS.topods.Face(exp.Current())
                surf1 = OCC.Core.BRep.BRep_Tool.Surface(face1)
                uvbounds1 = OCC.Core.BRepTools.breptools_UVBounds(face1)
                curvature1 = OCC.Core.GeomLProp.GeomLProp_SLProps(
                    surf1, uvbounds1[0], uvbounds1[2], 1, 1e-6)
                OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face1, props)
                exp2 = OCC.Core.TopExp.TopExp_Explorer(exp0.Current(), OCC.Core.TopAbs.TopAbs_FACE)
                while exp2.More():
                    face2 = OCC.Core.TopoDS.topods.Face(exp2.Current())
                    extrema = OCC.Core.BRepExtrema.BRepExtrema_ExtFF(face1, face2)
                    if OCC.Core.BRepExtrema.BRepExtrema_ExtFF.IsParallel(extrema):
                        if OCC.Core.BRepExtrema.BRepExtrema_ExtFF.SquareDistance(extrema, 1) > 0:
                            thickness = math.sqrt(
                                OCC.Core.BRepExtrema.BRepExtrema_ExtFF.SquareDistance(extrema, 1))
                            aux[exp.Current()] = [thickness, curvature1.Normal()]
                            flag = True
                    exp2.Next()
                if flag is False:  # Opposite face was not found.
                    aux[exp.Current()] = [0, curvature1.Normal()]
                exp.Next()
            exp0.Next()
        element_dict[element[0].GlobalId] = aux
        if element[0].GlobalId not in list(element_dict.keys()):
            problematicElement.append(element)
    return element_dict, problematicElement


def getWallInfo(walls):
    """
    See ElementFaceToThickness.
    """
    WallC, problematicWalls = ElementFaceToThickness(walls)
    return WallC, problematicWalls


def getSlabInfo(slabs):
    """
    See ElementFaceToThickness.
    """
    SlabC, problematicSlabs = ElementFaceToThickness(slabs)
    return SlabC


def getColumninfo(columns):
    """
    See ElementFaceToThickness.
    """
    ColumnC, problematicColumns = ElementFaceToThickness(columns)
    return ColumnC


def initSpaceContainer(ifc_file, black_list_spaces):
    """
    Create instances of the class SpaceContainer (see DataClasses.py) for each IfcSpace.
    Return it twice.
    Some basic information is stored into the initialized instances:
        - Volume of the Space in m3
        - List of Boundaries: Faces of the volume that defined the IfcSpace,
                              including face area and normal vector are used
                              to initialize the BoundaryContainer.
    """
    props = OCC.Core.GProp.GProp_GProps()
    ListOfSpaceContainer1 = []
    ListOfSpaceContainer2 = []
    spaces = ifc_file.by_type("IfcSpace")
    for space in spaces:
        if space.GlobalId not in black_list_spaces:
            addBoundaries = []
            volume_shape = ifcopenshell.geom.create_shape(settings, space).geometry
            # Use TopAbs_COMPOUND instead of ..SOLID (More generic)
            exp = OCC.Core.TopExp.TopExp_Explorer(volume_shape, OCC.Core.TopAbs.TopAbs_COMPOUND)
            i = 0
            while exp.More():
                # solid = OCC.Core.TopoDS.topods.Solid(exp.Current())
                OCC.Core.BRepGProp.brepgprop_VolumeProperties(exp.Current(), props)
                space_volume = props.Mass()
                i = i + 1
                exp.Next()
            if i > 1:
                # We assume IfcSpace to be a unique volume. Here this assumption was
                # briefly checked.
                print("Space ", space.GlobalId, "is composed of more than 1 voume, namely: ",
                      i, "( and is not correctly handled)")
            exp = OCC.Core.TopExp.TopExp_Explorer(volume_shape, OCC.Core.TopAbs.TopAbs_FACE)
            while exp.More():
                face = OCC.Core.TopoDS.topods.Face(exp.Current())
                surf = OCC.Core.BRep.BRep_Tool.Surface(face)
                uvbounds = OCC.Core.BRepTools.breptools.UVBounds(face)
                curvature = OCC.Core.GeomLProp.GeomLProp_SLProps(surf,
                                                            uvbounds[0],
                                                            uvbounds[2],
                                                            1,
                                                            1e-6)
                OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                B = IfcLib.DataClasses.BoundaryContainer(face, props.Mass(), curvature.Normal())
                # Normal vectors (curvature.Normal()) of Faces normally point into the
                # inner volume! *Checked for walls and spaces
                addBoundaries.append(B)
                exp.Next()
            ListOfSpaceContainer1.append(IfcLib.DataClasses.SpaceContainer(
                space, Boundaries=addBoundaries, Volume=space_volume))
            ListOfSpaceContainer2.append(IfcLib.DataClasses.SpaceContainer(
                space, Boundaries=addBoundaries, Volume=space_volume))
    return ListOfSpaceContainer1, ListOfSpaceContainer2


def commonFace_andArea(shape1, shape2):
    """
    A common shape is obtained from shape1 and shape2 and returned together with the area in m2.
    If there is no such common shape then props.Mass() = 0.0
    """
    props = OCC.Core.GProp.GProp_GProps()
    common = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Common(shape1, shape2)
    #if common.BuilderCanWork():
    try:       
        common_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(common)
        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(common_shape, props)
        return common_shape, props.Mass(), True
    except:
        print("Common shape cannot be created *BRepBuilderAPI_MakeShape would not work... ")
        return shape1, 0.0, False


def commonFace_andArea_rebuildedFace(shape1, shape2):
    """
    Similar to commonFace_andArea. A common shape is obtained from shape1 and shape2.
    Before calculating it, shape1 and 2 are "rebuilded" (see RebuildFace). A common shape
    is obtained and returned together with its area. Again, if there is no such common
    shape then props.Mass() = 0.0
    """
    props = OCC.Core.GProp.GProp_GProps()
    corrected_shape1 = RebuildFace(shape1)[0]
    corrected_shape2 = RebuildFace(shape2)[0]
    common = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Common(corrected_shape1, corrected_shape2)
    #if common.BuilderCanWork():
    try:
        common_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(common)
        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(common_shape, props)
        return common_shape, props.Mass(), True
    #else:
    except:
        # print("Common shape cannot be created *BRepBuilderAPI_MakeShape would not work...")
        return shape1, 0.0, False


def CuttedShape(shape1, shape2):
    """
    Shape2 cuts shape1. Resultant face and its area is returned.
    """
    props = OCC.Core.GProp.GProp_GProps()
    cut = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Cut(shape1, shape2)
    #if cut.BuilderCanWork():
    try:
        cut_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cut)
        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(cut_shape, props)
        return cut_shape, props.Mass(), True
    #else:
    except:
        return shape1, 0, False


def RelatedElementsWalls(Spaces, ifc_file, WallInfo, SlabsInfo):
    """
    Pre-calculation to obtain second level boundaries of the IfcSpaces.
    The faces of the IfcWall are compared to the boundary faces of the IfcSpaces
    contained into Spaces. Thus identifying which walls are attached to each zone.
    The Information is stored for later use into the dictionary RelatedWall of each
    SpaceContainer instance. Dictionaries use as the key the GlobalId of attached building
    element and as the value the shape of the common face.

    An updated list of SpaceContainer as well as a black list of walls is returned.
    The black list contains walls that are inside of a volume (internal walls)
    """
    props = OCC.Core.GProp.GProp_GProps()
    all_walls = ifc_file.by_type("IfcWall")
    black_list_walls = []  # add internal IfcWall to a black list
    ToBeRepairWall = []  # add IfcWall that collide to an IfcSpace in this list
    all_slabs = ifc_file.by_type("IfcSlab")
    black_list_slabs = []  # add internal IfcSlabs to a black list
    ToBeRepairSlabs = []  # add IfcWall that collide to an IfcSpace in this list
    # Nothing is done so far.
    # But it might be possible to redefine the space, at least its boundary.
    for sp in Spaces:
        print("Space: ", sp.Space.GlobalId)
        RelatedWall = {}
        RelatedSlab = {}
        space_volume = ifcopenshell.geom.create_shape(settings, sp.Space).geometry
        # We are interested in the space boundaries and attached walls between volumes,
        # and not in internal walls.
        # A "black list" with internal walls is created. These walls will be disregarded.
        for w in all_walls:
            if w.GlobalId in list(WallInfo.keys()):
                wall_shape = ifcopenshell.geom.create_shape(settings, w).geometry
                OCC.Core.BRepGProp.brepgprop_VolumeProperties(wall_shape, props)
                wall_volume = props.Mass()
                cmn_shape, area, BuilderCanWork = commonFace_andArea(wall_shape, space_volume)
                OCC.Core.BRepGProp.brepgprop_VolumeProperties(cmn_shape, props)
                if props.Mass() > wall_volume * 0.9:
                    black_list_walls.append(w.GlobalId)
                elif props.Mass() > 0.01:
                    print("Wall ", str(w.GlobalId), " does collide with Space",
                          str(sp.Space.GlobalId), " and needs to be repaired...")
                    ToBeRepairWall.append(w.GlobalId)
                    black_list_walls.append(w.GlobalId)  # Also into black list!
        for s in all_slabs:
            if s.GlobalId in list(SlabsInfo.keys()):
                slab_shape = ifcopenshell.geom.create_shape(settings, s).geometry
                OCC.Core.BRepGProp.brepgprop_VolumeProperties(slab_shape, props)
                slab_volume = props.Mass()
                cmn_shape, area, BuilderCanWork = commonFace_andArea(slab_shape, space_volume)
                OCC.Core.BRepGProp.brepgprop_VolumeProperties(cmn_shape, props)
                if props.Mass() > slab_volume * 0.9:
                    black_list_slabs.append(s.GlobalId)
                elif props.Mass() > 0.0001:
                    print("slab_volume: ", slab_volume, " ... ", props.Mass())
                    print("Slab ", str(s.GlobalId), " does collide with Space",
                          str(sp.Space.GlobalId), " and needs to be repaired...")
                    ToBeRepairSlabs.append(s.GlobalId)
                    black_list_slabs.append(s.GlobalId)  # Also into black list!
        for b in sp.Boundaries:
            # Each boundary Face, currently Face of IfcSpace, is compared to each face of
            # any ifcWall (exclude walls from black list), IfcSpace, IfcSlab, IfcColumn, etc.
            # Searching for a match, it means a common shape with props.Mass() > 0
            # When found the information (GlobalId, common shape and original Face) is stored
            # in one of the previously initialized dictionaries (RelatedOpening, RelatedWall, ..)
            FACE = b.Face
            # It might be convenient to limit iteration by distinguishing between vertical and horizontal boundaries.
            # It could speed up the process but fail for not well defined or tilted surfaces.
            # Relatively safe approach to be tested is to use 3 groups. vertical, horizontal and others.
            # horizontal boundaries no need to iterate over walls, vertical no need to iterate over slabs.
            # Need to iterate over openings columns, etc for any boundary. WALLS SECTION !!!
            for key in WallInfo:
                if key not in black_list_walls:
                    aux_list = []
                    for shape in WallInfo[key]:
                        cmn_shape, area, BuilderCanWork = commonFace_andArea(FACE, shape)
                        if area > 0:
                            aux_list.append([cmn_shape, shape])
                        else:
                            cmn_shape, area, BuilderCanWork = commonFace_andArea_rebuildedFace(
                                FACE, shape)
                            if area > 0:
                                aux_list.append([cmn_shape, shape])
                    if aux_list:
                        if key in list(RelatedWall.keys()):
                            aux_list.extend(RelatedWall[key])
                            RelatedWall[key] = aux_list
                        else:
                            RelatedWall[key] = aux_list
            # SLABS SECTION !!!
            for key in SlabsInfo:
                if key not in black_list_slabs:
                    aux_list = []
                    for shape in SlabsInfo[key]:
                        cmn_shape, area, BuilderCanWork = commonFace_andArea(FACE, shape)
                        if area > 0:
                            aux_list.append([cmn_shape, shape])
                        else:
                            # print("Face 4 ", FACE, " - ", shape)
                            cmn_shape, area, BuilderCanWork = commonFace_andArea_rebuildedFace(
                                FACE, shape)
                            if area > 0:
                                aux_list.append([cmn_shape, shape])
                    if aux_list:
                        if key in list(RelatedSlab.keys()):
                            aux_list.extend(RelatedSlab[key])
                            RelatedSlab[key] = aux_list
                        else:
                            RelatedSlab[key] = aux_list
        sp.RelatedSlab = RelatedSlab
        sp.RelatedWall = RelatedWall
    return Spaces, black_list_walls, black_list_slabs


def SecondLvLBoundariesWalls(Spaces, WallInfo, SlabsInfo):
    """
    The information regarding the Wall-boundaries obtained with RelatedElementsWalls and
    stored into the dictionary RelatedWall is now used to update the boundaries
    of each space. Furthermore the area of these new boundary and the normal
    vector (probably not necessary..) are calculated.

    A thickness is assigned to each boundary. The thickness corresponds always
    to the thickness of the wall. If the 2nd level space boundary is
    attached to an opening (window or door) the thickness of the wall that contains
    this openings is used!
    """
    props = OCC.Core.GProp.GProp_GProps()
    for sp in Spaces:
        addBoundaries = []
        for wall_key in sp.RelatedWall:
            for wall_shape in sp.RelatedWall[wall_key]:
                face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                    wall_shape[0], OCC.Core.TopAbs.TopAbs_FACE).Current())
                OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                B = IfcLib.DataClasses.BoundaryContainer(
                    face, props.Mass(), WallInfo[wall_key][wall_shape[1]][1])
                B.RelatedBuildingElement = wall_key
                B.thickness = [WallInfo[wall_key][wall_shape[1]][0]]
                addBoundaries.append(B)
        for slab_key in sp.RelatedSlab:
            for slab_shape in sp.RelatedSlab[slab_key]:
                face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                    slab_shape[0], OCC.Core.TopAbs.TopAbs_FACE).Current())
                surf = OCC.Core.BRep.BRep_Tool.Surface(face)
                uvbounds = OCC.Core.BRepTools.breptools.UVBounds(face)
                curvature = OCC.Core.GeomLProp.GeomLProp_SLProps(surf, uvbounds[0], uvbounds[2], 1, 1e-6)
                OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                B = IfcLib.DataClasses.BoundaryContainer(face, props.Mass(), curvature.Normal())
                B.RelatedBuildingElement = slab_key
                B.thickness = [SlabsInfo[slab_key][slab_shape[1]][0]]
                addBoundaries.append(B)
        sp.Boundaries = addBoundaries
    return Spaces


def SpaceBoundariesWithoutWalls(Spaces, SpacesW):
    """
    Spaces should contain an initialized SpaceContainer list (based on space volume geometry),
    while SpacesW was updated using IfcWall geometries. Here the Spaces list is updated by
    removing all boundaries which belong (are attached to) an IfcWall.
    """
    for sp in Spaces:
        addBoundaries = []
        for b in sp.Boundaries:
            current = b.Face
            current_M = b.Area
            flag = False
            for sp2 in SpacesW:
                for b2 in sp2.Boundaries:
                    FACE, m, BuilderCanWork = CuttedShape(current, b2.Face)
                    if m < current_M:
                        if m != 0:
                            current = FACE
                            current_M = m
                        else:
                            flag = True
            if not flag:
                B = IfcLib.DataClasses.BoundaryContainer(current, current_M, b.Normal)
                addBoundaries.append(B)
        sp.Boundaries = addBoundaries
    return Spaces


def RelatedElements(Spaces, ifc_file, WallInfo, ColumnsInfo):
    """
    Pre-calculation to obtain second level boundaries of the IfcSpaces.
    The faces of the different building elements (IfcSlab and
    IfcRelVoidsElement, but not IfcWall) are compared to the boundary faces of the IfcSpaces
    contained into Spaces (previously modified to remove boundaries attached to walls.
    Thus identifying which elements are attached to each zone.
    The Information is stored into dictionaries (RelatedSlab, RelatedOpening)
    whitin each SpaceContainer instance. Dictionaries uses as key
    the GlobalId of attached building element and as value the shape of the common face.

    Furthermore, a dictionary (OpeningsDict) that links each opening/void
    (IfcRelVoidsElement) to the building element that fills the void (IfcDoor, IfcWindow, ...)
    is created and returned.
    """
    props = OCC.Core.GProp.GProp_GProps()
    VoidsElement = ifc_file.by_type("IfcRelVoidsElement")
    FillsElement = ifc_file.by_type("IfcRelFillsElement")
    # key = If of opening element, value = [shape,instance of door/window..., instance of wall]
    OpeningsDict = {}
    # occ_display = ifcopenshell.geom.utils.initialize_display()
    Void = {}  # Use Volume to find boundaries/relations. Volume is in contact with
    # more than one face. Thus we presearch area of biggest face
    # so that small lateral connections are disregarded.
    giv = []
    for sp in Spaces:
        RelatedOpening = {}
        RelatedSpace = {}
        RelatedColumn = {}
        black_list = []
        Opening_keys = []
        for b in sp.Boundaries:
            # Each boundary Face, currently Face of IfcSpace, is compared to each face of
            # any IfcSpace, IfcSlab, IfcColumn (but not IfcWall) searching for a match.
            # It means a common shape with props.Mass() > 0. When found the information
            # (GlobalId, common shape and original Face) is stored in one of the previously
            # initialized dictionaries (RelatedOpening, RelatedWall, ..)
            FACE = b.Face
            FaceArea = b.Area
            # if b.Normal.Z() <= 0.0001 and b.Normal.Z() >= -0.0001:
            # It might be convinient to limit iteration by distinguishing between vertical and horizontal boundaries.
            # It could speed up the process but fail for not well defined or tilted surfaces.
            # Relatively safe approach to be tested is to use 3 groups. vertical, horizontal and others.
            # horizontal boundaries no need to iterate over walls, vertical no need to iterate over slabs.
            # Need to iterate over openings columns, etc for any boundary.
            # SPACE SECTION !!!
            for sp2 in Spaces:
                aux_list = []
                if sp != sp2:
                    for b2 in sp2.Boundaries:
                        if FaceArea <= 0.00001:
                            break
                        else:
                            cmn_shape, area, BuilderCanWork = commonFace_andArea(FACE, b2.Face)
                            if area > 0:
                                FaceArea = FaceArea - area
                                aux_list.append([cmn_shape, b2.Face])
                            else:
                                # print("Face 2: ", FACE, " - ", b2.Face)
                                cmn_shape, area, BuilderCanWork = commonFace_andArea_rebuildedFace(
                                    FACE, b2.Face)
                                if area > 0:
                                    FaceArea = FaceArea - area
                                    aux_list.append([cmn_shape, b2.Face])
                    if aux_list:
                        if sp2.Space.GlobalId in list(RelatedSpace.keys()):
                            aux_list.extend(RelatedSpace[sp2.Space.GlobalId])
                            RelatedSpace[sp2.Space.GlobalId] = aux_list
                        else:
                            RelatedSpace[sp2.Space.GlobalId] = aux_list
            # COLUMNS SECTION !!
            for key in ColumnsInfo:
                aux_list = []
                for shape in ColumnsInfo[key]:
                    if FaceArea <= 0.00001:
                        break
                    else:
                        cmn_shape, area, BuilderCanWork = commonFace_andArea(FACE, shape)
                        if area > 0:
                            FaceArea = FaceArea - area
                            aux_list.append([cmn_shape, shape])
                        else:
                            # print("Face 3 ", FACE, " - ", shape)
                            cmn_shape, area, BuilderCanWork = commonFace_andArea_rebuildedFace(
                                FACE, shape)
                            if area > 0:
                                FaceArea = FaceArea - area
                                aux_list.append([cmn_shape, shape])
                if aux_list:
                    if key in list(RelatedColumn.keys()):
                        aux_list.extend(RelatedColumn[key])
                        RelatedColumn[key] = aux_list
                    else:
                        RelatedColumn[key] = aux_list
            # OPENINGS SECTION !!!
            for element in VoidsElement:
                if FaceArea <= 0.00001:
                    break
                else:
                    opening_shape = ifcopenshell.geom.create_shape(
                        settings, element.RelatedOpeningElement).geometry
                    cmn_shape, area, BuilderCanWork = commonFace_andArea(FACE, opening_shape)
                    if area > 0:
                        # if element.RelatingBuildingElement.GlobalId in ConnectedWalls_keys:
                        # opening volume might interact with more than one space-Face.
                        # we filter to the face attached to the wall with the opening.
                        if element.RelatedOpeningElement.GlobalId in list(RelatedOpening.keys()):
                            OCC.Core.BRepGProp.brepgprop_SurfaceProperties(cmn_shape, props)
                            A_new = props.Mass()
                            OCC.Core.BRepGProp.brepgprop_SurfaceProperties(
                                RelatedOpening[element.RelatedOpeningElement.GlobalId], props)
                            A = props.Mass()
                            if A_new > A:
                                RelatedOpening[element.RelatedOpeningElement.GlobalId] = cmn_shape
                                for fillele in FillsElement:
                                    if fillele.RelatingOpeningElement.GlobalId == element.RelatedOpeningElement.GlobalId:
                                        # create list of possible thickness:
                                        thick_list = []
                                        for x in list(
                                                WallInfo[element.RelatingBuildingElement.GlobalId].values()):
                                            if x[0] != 0 and x[0] not in thick_list and x[0] < 0.5:
                                                thick_list.append(x[0])
                                        OpeningsDict[element.RelatedOpeningElement.GlobalId] = [
                                            opening_shape, fillele.RelatedBuildingElement,
                                            element.RelatingBuildingElement, thick_list]
                        else:
                            RelatedOpening[element.RelatedOpeningElement.GlobalId] = cmn_shape
                            for fillele in FillsElement:
                                if fillele.RelatingOpeningElement.GlobalId == element.RelatedOpeningElement.GlobalId:
                                    # create list of possible thickness:
                                    thick_list = []
                                    for x in list(
                                            WallInfo[element.RelatingBuildingElement.GlobalId].values()):
                                        if x[0] != 0 and x[0] not in thick_list and x[0] < 0.5:
                                            thick_list.append(x[0])
                                    OpeningsDict[element.RelatedOpeningElement.GlobalId] = [
                                        opening_shape, fillele.RelatedBuildingElement, element.RelatingBuildingElement,
                                        thick_list]
                                    # else: #else clause was used when distinguishing between vertical and
                                    # horizontal boundaries.
        sp.RelatedOpening = RelatedOpening
        sp.RelatedSpace = RelatedSpace
        sp.RelatedColumn = RelatedColumn
    return Spaces, OpeningsDict, giv


def OverlappedOpenings(Spaces):
    """
    The opening geometry/representation is (in general) a simple box, an approximate geometry of the contained
    element (window or door). During the previous steps, because of the rough and bigger box-geometry,
    more "matches" between space and openings than the actually present might be found.
    Here the opening-connections founds are checked. Overlapped (potential*) boundaries are searched.
        *potential boundaries: because they not yet defined. Information contained into dictionary)
    If common face is found the criteria is to keep the bigger boundary and discard the smaller.
    In the worst (not expected) case two boundaries might have the same size. In that case
    another check would be necessary...
    """
    props = OCC.Core.GProp.GProp_GProps()
    for sp in Spaces:
        Discard = []
        RelatedOpening_new = {}
        for opening_key, opening_shape in list(sp.RelatedOpening.items()):
            for opening_key2, opening_shape2 in list(sp.RelatedOpening.items()):
                if opening_key != opening_key2:
                    cmn_shape, area, BuilderCanWork = commonFace_andArea(
                        opening_shape2, opening_shape)
                    if area != 0:
                        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(opening_shape, props)
                        A1 = props.Mass()
                        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(opening_shape2, props)
                        A2 = props.Mass()
                        if A1 > A2:
                            Discard.append(opening_key2)
        for opening_key, opening_shape in list(sp.RelatedOpening.items()):
            if opening_key not in Discard:
                RelatedOpening_new[opening_key] = opening_shape
        sp.RelatedOpening = RelatedOpening_new
    return Spaces


def addVirtualBoundaries(Spaces):
    """
    IfcSpace relation to surrounding elements should already be finished.
    There might be still some (part of) face that did not match with any building element.
    The following sections should find these remaining faces and include them in the Space definition.
    Notice that unfilled openings (IfcOpeningElement with without IfcRelFillsElement)
    were already detected and treated as openings and thus will not be defined as "VIRTUAL".
    """
    for sp in Spaces:
        aux_list = []
        for b in sp.Boundaries:
            FACE = b.Face
            AREA = b.Area
            m = b.Area
            for key in sp.RelatedWall:
                for shape_list in sp.RelatedWall[key]:
                    FACE, m, BuilderCanWork = CuttedShape(FACE, shape_list[0])
            for key in sp.RelatedOpening:
                FACE, m, BuilderCanWork = CuttedShape(FACE, sp.RelatedOpening[key])
            for key in sp.RelatedSlab:
                for shape_list in sp.RelatedSlab[key]:
                    FACE, m, BuilderCanWork = CuttedShape(FACE, shape_list[0])
            for key in sp.RelatedSpace:
                for shape_list in sp.RelatedSpace[key]:
                    FACE, m, BuilderCanWork = CuttedShape(FACE, shape_list[0])
            for key in sp.RelatedColumn:
                for shape_list in sp.RelatedColumn[key]:
                    FACE, m, BuilderCanWork = CuttedShape(FACE, shape_list[0])
            if 0 < m <= b.Area:
                aux_list.append([FACE, m, b.Normal])
        sp.RelatedVirtual = aux_list
    return Spaces


def SecondLvLBoundaries(Spaces, SpacesW, WallInfo, OpeningsDict, SlabsInfo, ColumnsInfo):
    """
    The information regarding the boundaries obtained with RelatedElements and
    stored into three different dictionaries is now used to update the boundaries
    of each space. Furthermore the are of these new boundary and the normal
    vector (probably not necessary..) are calculated.

    A thickness is assigned to each boundary. The thickness corresponds always
    to the thickness of the wall (or slab). If the 2nd level space boundary is
    attached to an opening (window or door) the thickness of the wall that contains
    this openings is used!
    """
    # occ_display = ifcopenshell.geom.utils.initialize_display()
    props = OCC.Core.GProp.GProp_GProps()
    for sp in Spaces:
        addBoundaries = []
        for sp2 in SpacesW:
            if sp.Space.GlobalId == sp2.Space.GlobalId:  # probably superfluos -if clause-
                for wall_key in sp2.RelatedWall:
                    for wall_shape in sp2.RelatedWall[wall_key]:
                        face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                            wall_shape[0], OCC.Core.TopAbs.TopAbs_FACE).Current())
                        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                        bou = IfcLib.DataClasses.BoundaryContainer(
                            face, props.Mass(), WallInfo[wall_key][wall_shape[1]][1])
                        bou.RelatedBuildingElement = wall_key
                        bou.thickness = [WallInfo[wall_key][wall_shape[1]][0]]
                        addBoundaries.append(bou)
                for slab_key in sp2.RelatedSlab:
                    for slab_shape in sp2.RelatedSlab[slab_key]:
                        face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                            slab_shape[0], OCC.Core.TopAbs.TopAbs_FACE).Current())
                        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                        uvbounds = OCC.Core.BRepTools.breptools.UVBounds(face)
                        surf = OCC.Core.BRep.BRep_Tool.Surface(face)
                        curvature = OCC.Core.GeomLProp.GeomLProp_SLProps(
                            surf, uvbounds[0], uvbounds[2], 1, 1e-6)
                        bou = IfcLib.DataClasses.BoundaryContainer(
                            face, props.Mass(), curvature.Normal())
                        bou.RelatedBuildingElement = slab_key
                        bou.thickness = [SlabsInfo[slab_key][slab_shape[1]][0]]
                        addBoundaries.append(bou)
                # Copy (link) to dictionaries RelatedSlab and RelatedWall
                sp.RelatedSlab = sp2.RelatedSlab
                sp.RelatedWall = sp2.RelatedWall
        for opening_key, opening_shape in list(sp.RelatedOpening.items()):
            face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                opening_shape, OCC.Core.TopAbs.TopAbs_FACE).Current())
            surf = OCC.Core.BRep.BRep_Tool.Surface(face)
            uvbounds = OCC.Core.BRepTools.breptools.UVBounds(face)
            curvature = OCC.Core.GeomLProp.GeomLProp_SLProps(surf, uvbounds[0], uvbounds[2], 1, 1e-6)
            OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
            if opening_key in list(OpeningsDict.keys()):
                bou = IfcLib.DataClasses.BoundaryContainer(face, props.Mass(), curvature.Normal())
                bou.RelatedBuildingElement = OpeningsDict[opening_key][1].GlobalId
                bou.thickness = OpeningsDict[opening_key][3]
            else:
                bou = IfcLib.DataClasses.BoundaryContainer(face, props.Mass(), curvature.Normal())
                bou.RelatedBuildingElement = None  # No filling!
                bou.thickness = [0]
            addBoundaries.append(bou)
        for spaceId in sp.RelatedSpace:
            for shape in sp.RelatedSpace[spaceId]:
                face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                    shape[0], OCC.Core.TopAbs.TopAbs_FACE).Current())
                surf = OCC.Core.BRep.BRep_Tool.Surface(face)
                uvbounds = OCC.Core.BRepTools.breptools.UVBounds(face)
                curvature = OCC.Core.GeomLProp.GeomLProp_SLProps(surf, uvbounds[0], uvbounds[2], 1, 1e-6)
                OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                bou = IfcLib.DataClasses.BoundaryContainer(face, props.Mass(), curvature.Normal())
                bou.RelatedBuildingElement = "VIRTUAL"
                bou.thickness = [0]
                addBoundaries.append(bou)
        for column_key in sp.RelatedColumn:
            for shape in sp.RelatedColumn[column_key]:
                face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                    shape[0], OCC.Core.TopAbs.TopAbs_FACE).Current())
                surf = OCC.Core.BRep.BRep_Tool.Surface(face)
                uvbounds = OCC.Core.BRepTools.breptools.UVBounds(face)
                curvature = OCC.Core.GeomLProp.GeomLProp_SLProps(surf, uvbounds[0], uvbounds[2], 1, 1e-6)
                OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                bou = IfcLib.DataClasses.BoundaryContainer(face, props.Mass(), curvature.Normal())
                bou.RelatedBuildingElement = column_key
                bou.thickness = [ColumnsInfo[column_key][shape[1]][0]]
                addBoundaries.append(bou)
        for virtual in sp.RelatedVirtual:
            bou = IfcLib.DataClasses.BoundaryContainer(virtual[0], virtual[1], virtual[2])
            bou.RelatedBuildingElement = "VIRTUAL"
            bou.thickness = [0]
            addBoundaries.append(bou)
        sp.Boundaries = addBoundaries
    return Spaces


def RebuildFace(shape, round_degree=4):
    """
    They input shape (expected to be a Face) is recreated by rounding its vertex coordinates,
    using them to redefine the edges and finally the face.

    *Some faces are not fully planar. Rebuild faces might help to solve this issue.
    """
    # make sure round_degree is an int.
    round_degree = int(round_degree)
    # Make sure the face is of the type TopoDS_Face.
    face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
        shape, OCC.Core.TopAbs.TopAbs_FACE).Current())
    surf = OCC.Core.BRep.BRep_Tool.Surface(face)
    flag = OCC.Core.GeomLib.GeomLib_IsPlanarSurface(surf)
    profiles = []
    pointlist = []
    gaps = []
    Resolution = 1e-12
    if flag.IsPlanar():  # Just planar faces are treated.
        props = OCC.Core.GProp.GProp_GProps()
        exp = OCC.Core.TopExp.TopExp_Explorer(shape, OCC.Core.TopAbs.TopAbs_EDGE)
        list_edges = []
        curvature_flag = False
        # Extract edges of the face
        while exp.More() and not curvature_flag:
            # Check curvature of the edges: Face with curved edges cannot be handle it so far.
            # In this case, process will be interrupted and RebuildFace will return
            # the original face.
            E = OCC.Core.TopoDS.topods.Edge(exp.Current())
            H = OCC.Core.BRep.BRep_Tool.Curve(E)
            U = 0.5 * H[1] + 0.5 * H[2]
            prop = OCC.Core.GeomLProp.GeomLProp_CLProps(H[0], U, 2, Resolution)
            curvature = OCC.Core.GeomLProp.GeomLProp_CLProps.Curvature(prop)
            if curvature != 0.0:
                curvature_flag = True
            list_edges.append(exp.Current())
            exp.Next()
        if len(list_edges) >= 2 and not curvature_flag:
            # The "len(list_edges) >= 2" if clause might be removed.
            # It think It was added before filtering curved faces.
            # single edge was present, starting and ending in the same point.
            decomposed_edge = []  # Extract vertex from edges
            for edge in list_edges:
                exp = OCC.Core.TopExp.TopExp_Explorer(edge, OCC.Core.TopAbs.TopAbs_VERTEX)
                list_v = []
                while exp.More():
                    list_v.append(exp.Current())
                    exp.Next()
                decomposed_edge.append(list_v)

            list_gp = []  # Convert Vertex to gp_pnt
            for edge_v in decomposed_edge:
                list_gp.append([OCC.Core.BRep.BRep_Tool_Pnt(OCC.Core.TopoDS.topods.Vertex(edge_v[0])),
                                OCC.Core.BRep.BRep_Tool_Pnt(OCC.Core.TopoDS.topods.Vertex(edge_v[1]))])
            # Round point (vertex) coordinates
            for gp in list_gp:
                for p in gp:
                    p.SetX(round(p.X(), round_degree))
                    p.SetY(round(p.Y(), round_degree))
                    p.SetZ(round(p.Z(), round_degree))
                # Sometimes the shape to be rebuilt contains a really small edge that after rounding, the two points
                # of the edge become the same points. It impides the function to work.
                # This 0-length edges are here filtered:
            list_gp_new = []
            for gp in list_gp:
                if gp[0].Coord() != gp[1].Coord():
                    list_gp_new.append([gp[0], gp[1]])
            list_gp = list_gp_new
            sub_faces = []
            ordered_gp = [list_gp[0]]  # Initialize ordered_gp list. List used to
            # order the points, necessary for a correct definition of the edges and later the face.
            # START to order points:
            del list_gp[0]
            searched_pnt = ordered_gp[-1][1]
            while list_gp:
                # print("searching for ", searched_pnt.Coord(), " in :")
                flag = True
                for j in range(len(list_gp)):
                    if searched_pnt.Coord() == list_gp[j][0].Coord():
                        # print("A: found! ", searched_pnt.Coord(), "==", list_gp[j][0].Coord()," at position ", j)
                        ordered_gp.append(list_gp[j])
                        searched_pnt = list_gp[j][1]
                        tbdeleted = j
                        flag = False
                        break
                    elif searched_pnt.Coord() == list_gp[j][1].Coord():
                        # print("B: found! ", searched_pnt.Coord(), "==", list_gp[j][1].Coord()," at position ", j)
                        ordered_gp.append([list_gp[j][1], list_gp[j][0]])
                        searched_pnt = list_gp[j][0]
                        tbdeleted = j
                        flag = False
                        break
                if flag and list_gp:
                    # Points was not found in the list (Current face suppose to be clompeted).
                    # Take another point and restart the process (rebuilding next face).
                    sub_faces.append(ordered_gp)
                    ordered_gp = [list_gp[0]]  # Order points
                    del list_gp[0]
                    searched_pnt = ordered_gp[-1][1]
                else:
                    del list_gp[tbdeleted]
                    # FINISHING ORDERING POINTS.
                    # START REBUILDING EDGES:
            sub_faces.append(ordered_gp)
            rebuilded = []
            for ordered in sub_faces:
                rebuild_edge = []  # Rebuild edges
                for edge_gp in ordered:
                    rebuild_edge.append(OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeEdge(
                        edge_gp[0], edge_gp[1]).Edge())
                    # print("len rebuild_edge ", len(rebuild_edge))
                # 4 edges is the max allowed by BRepBuilderAPI_MakeWire. Thus a wire with the first 4 edges is created.
                # The used edges are deleted from the originally list, rebuild_edge.
                grouped = []
                grouped = rebuild_edge[:4]
                del rebuild_edge[:4]
                #
                wire = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeWire(*grouped)
                # print("wire: ", wire.Wire(), " and ", rebuild_edge)
                # If rebuild_edge contain more edges, these are added one by one to the previously created wire.
                for extra_edge in rebuild_edge:
                    wire = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeWire(wire.Wire(), extra_edge)
                # A succeful process should end up with a closed wire:
                if not wire.Wire().Closed():  # Check face
                    print("Function 'RebuildFace' failed to rebuild face!")
                rebuilded.append(OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeFace(wire.Wire()).Face())

            # The following section is used to decide which of the faces contained in "rebuilded" is the main face
            # (the bigger face) and which are gaps (other faces)
            if len(rebuilded) >= 2:
                maxMass = 0
                for face in rebuilded:
                    OCC.Core.BRepGProp.brepgprop_SurfaceProperties(face, props)
                    if props.Mass() >= maxMass:
                        maxMass = props.Mass()
                        bigface = face
                finalF = bigface
                # The main face (bigface) was found. Bigface is cuted by the other faces (gaps)
                for face in rebuilded:
                    if face != bigface:
                        finalF, a, BuilderCanWork = CuttedShape(finalF, face)
                        exp = OCC.Core.TopExp.TopExp_Explorer(face, OCC.Core.TopAbs.TopAbs_VERTEX)
                        pointlist_gaps = []
                        while exp.More():
                            pnt = OCC.Core.BRep.BRep_Tool.Pnt(OCC.Core.TopoDS.topods.Vertex(exp.Current()))
                            pointlist_gaps.append(pnt)
                            exp.Next()  # <- Jump two points (next edge): Avoid to add same point twice !
                            exp.Next()
                        gaps.append(pointlist_gaps)
                exp = OCC.Core.TopExp.TopExp_Explorer(finalF, OCC.Core.TopAbs.TopAbs_VERTEX)
                while exp.More():
                    pnt = OCC.Core.BRep.BRep_Tool.Pnt(OCC.Core.TopoDS.topods.Vertex(exp.Current()))
                    ignore_p = False
                    for list_p in gaps:
                        # Check whether point exists
                        if isPointInList(pnt, list_p) and not ignore_p:
                            ignore_p = True
                    if not ignore_p:
                        pointlist.append(pnt)
                        V = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeVertex(pnt)
                        # ifcopenshell.geom.utils.display_shape(V.Vertex())
                    exp.Next()
                    exp.Next()
                profiles = pointlist
            else:
                finalF = rebuilded[0]
                exp = OCC.Core.TopExp.TopExp_Explorer(rebuilded[0], OCC.Core.TopAbs.TopAbs_VERTEX)
                while exp.More():
                    pnt = OCC.Core.BRep.BRep_Tool.Pnt(OCC.Core.TopoDS.topods.Vertex(exp.Current()))
                    pointlist.append(pnt)
                    exp.Next()
                    exp.Next()
                profiles = pointlist
        else:
            finalF = shape  # Face has less than 2 edges and/or some curved edge.
    else:
        # If face is not planar, nothing is done and the same shape/face is returned.
        finalF = shape

    return finalF, profiles, gaps


def UpdateSecondLvLBoundaries(Spaces, WallInfo, ColumnsInfo, black_list):
    """
    The surroundings of each IfcSpace are explored in order to correctly
    define the 2nd and 3rd level boundaries. Boundaries are, if necessary,
    updated according to its surrounding spaces (correct 2nd level boundary)
    or walls (3rd level boundaries).

    The boundaries of specific IfcSpace connect these space to a building
    element (if not VIRTUAL) which is, at the same time, connected to another
    building element or space. This information is with this function obtained
    and stored into the BoundaryContainer attributes "OtherSideSpace"
    and "RelatedBuildingElement"
    """
    props = OCC.Core.GProp.GProp_GProps()
    BoundaryToElement = {}
    Spaces_new = []
    boundaryIdGen = 1
    for sp in Spaces:
        new_boundaries = []
        for boundary in sp.Boundaries:
            if True:
                new_shapes = []
                vect = []
                # print("Bound: ", boundary.RelatedBuildingElement ,"thick: ", boundary.thickness)
                for thick in boundary.thickness:
                    vect.append(OCC.Core.gp.gp_Vec(boundary.Normal) * (abs(thick)))
                T = OCC.Core.gp.gp_Trsf()
                spacefound = False
                for v in vect:
                    # Normals suppose to be corrected.
                    # For some building elements is but the thickness not clear.
                    T.SetTranslation(v)
                    Translated = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(boundary.Face, T).Shape()
                    t_face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                        Translated, OCC.Core.TopAbs.TopAbs_FACE).Current())
                    AREA = boundary.Area
                    for sp2 in Spaces:
                        if True:
                            for boundary2 in sp2.Boundaries:
                                cmn_shape, area, BuilderCanWork = commonFace_andArea(
                                    t_face, boundary2.Face)
                                if area > 0:  # There is a common part!
                                    spacefound = sp2.Space.GlobalId
                                    # print("AREA: ", area-boundary.Area)
                                    if abs(area - boundary.Area) >= 0.00001:
                                        T.SetTranslation(-v)
                                        b_cmon = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(
                                            cmn_shape, T).Shape()
                                        b_cmonFace = OCC.Core.TopoDS.topods.Face(
                                            OCC.Core.TopExp.TopExp_Explorer(b_cmon, OCC.Core.TopAbs.TopAbs_FACE).Current())
                                        new_shapes.append(
                                            [b_cmonFace, area, boundary.Normal, sp2.Space.GlobalId])
                                else:
                                    cmn_shape, area, BuilderCanWork = commonFace_andArea_rebuildedFace(
                                        t_face, boundary2.Face)
                                    if area > 0:
                                        spacefound = sp2.Space.GlobalId
                                        if abs(area - boundary.Area) >= 0.00001:  # What for?
                                            T.SetTranslation(-v)
                                            b_cmon = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(
                                                cmn_shape, T).Shape()
                                            b_cmonFace = OCC.Core.TopoDS.topods.Face(
                                                OCC.Core.TopExp.TopExp_Explorer(b_cmon, OCC.Core.TopAbs.TopAbs_FACE).Current())
                                            new_shapes.append(
                                                [b_cmonFace, area, boundary.Normal, sp2.Space.GlobalId])

                if new_shapes:  # We found common parts
                    RemainingF = boundary.Face
                    for element in new_shapes:
                        B = IfcLib.DataClasses.BoundaryContainer(element[0], element[1], element[2])
                        B.RelatedBuildingElement = boundary.RelatedBuildingElement
                        B.OtherSideSpace = str(element[3])
                        B.thickness = boundary.thickness
                        B.Id = "B" + str(boundaryIdGen) + "_" + sp.Space.GlobalId + "_" + str(boundary.RelatedBuildingElement)
                        boundaryIdGen = boundaryIdGen + 1
                        new_boundaries.append(B)
                        RemainingF = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Cut(RemainingF, element[0])
                        RemainingF = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(RemainingF)
                    exp = OCC.Core.TopExp.TopExp_Explorer(RemainingF, OCC.Core.TopAbs.TopAbs_FACE)
                    while exp.More():
                        # If we had to cut the original boundary, there will be probably some remaining part
                        # These remaining parts might be either 3rd level boundaries (building element is behind the
                        # boundary) or external boundaries
                        # It is necessary to compare it with the faces of the building walls
                        # if there is a common part we have a 3rd level element.
                        # Otherwise we have an external boundary. It might be necessary to cut
                        # again! (TO BE DONE)
                        Face = OCC.Core.TopoDS.topods.Face(exp.Current())
                        OCC.Core.BRepGProp.brepgprop_SurfaceProperties(Face, props)
                        B = IfcLib.DataClasses.BoundaryContainer(
                            OCC.Core.TopoDS.topods.Face(exp.Current()), props.Mass(), element[2])
                        B.RelatedBuildingElement = boundary.RelatedBuildingElement
                        B.thickness = boundary.thickness
                        B.OtherSideSpace = "Unknown"
                        B.Id = "B" + str(boundaryIdGen) + "_" + sp.Space.GlobalId + "_" + str(boundary.RelatedBuildingElement)
                        boundaryIdGen = boundaryIdGen + 1
                        new_boundaries.append(B)
                        exp.Next()
                else:
                    if spacefound:
                        boundary.OtherSideSpace = str(spacefound)
                    else:
                        boundary.OtherSideSpace = "EXTERNAL"
                    boundary.Id = "B" + str(boundaryIdGen) + "_" + sp.Space.GlobalId + "_" + str(boundary.RelatedBuildingElement)
                    boundaryIdGen = boundaryIdGen + 1
                    new_boundaries.append(boundary)
        spC = IfcLib.DataClasses.SpaceContainer(
            sp.Space,
            new_boundaries,
            sp.Volume,
            sp.RelatedWall,
            sp.RelatedOpening,
            sp.RelatedSlab,
            sp.RelatedSpace,
            sp.RelatedColumn)
        Spaces_new.append(spC)
    return Spaces_new


def DefinePosition(Spaces):
    """
    An average position of each Space and Boundary is defined.
    Points of the outer profile, contained into the attribute "Profile"
    of the BoundaryContainer class are used
    """
    for sp in Spaces:
        for b in sp.Boundaries:
            count = 0
            X = 0
            Y = 0
            Z = 0
            for pnt in b.Profile:
                X = X + pnt.X()
                Y = Y + pnt.Y()
                Z = Z + pnt.Z()
                count = count + 1
            if count != 0:
                b.Position = OCC.Core.gp.gp_Pnt(X / count, Y / count, Z / count)
            # Faces with curved edges do not have a well defined Profile. (Attribute is empty)
            else:
                # Alternatively, temporary position is defined from all points.
                exp = OCC.Core.TopExp.TopExp_Explorer(b.Face, OCC.Core.TopAbs.TopAbs_VERTEX)
                while exp.More():
                    vertex = OCC.Core.TopoDS.topods.Vertex(exp.Current())
                    pnt = OCC.Core.BRep.BRep_Tool.Pnt(vertex)
                    X = X + pnt.X()
                    Y = Y + pnt.Y()
                    Z = Z + pnt.Z()
                    count = count + 1
                    exp.Next()
                b.Position = OCC.Core.gp.gp_Pnt(X / count, Y / count, Z / count)
    return Spaces


def WD_Vertex(RelatedOpening):
    WindowAndDoorPoints = []
    for key, value in list(RelatedOpening.items()):
        exp = OCC.Core.TopExp.TopExp_Explorer(value, OCC.Core.TopAbs.TopAbs_VERTEX)
        while exp.More():
            vertex = OCC.Core.TopoDS.topods.Vertex(exp.Current())
            WindowAndDoorPoints.append(WindowAndDoorPoints)
            exp.Next()
    return WindowAndDoorPoints


def BoundariesHeightWidth(Spaces, WindowToStyle, DoorToStyle, ifc_file):
    """
    The attribute Height and Width is updated for all Boundaries.
    Boundaries which related building element is a door or a window use from Ifc file obtained widht and height
    For any other boundaries the Vertex of the Edges of the face that defined the boundary are explored.
    """
    slabs = ifc_file.by_type("IfcSlab")
    for sp in Spaces:
        for boundary in sp.Boundaries:
            if boundary.RelatedBuildingElement in list(DoorToStyle.keys()):  # Doors
                boundary.Width = DoorToStyle[boundary.RelatedBuildingElement][1]
                boundary.Height = DoorToStyle[boundary.RelatedBuildingElement][0]
            elif boundary.RelatedBuildingElement in list(WindowToStyle.keys()):  # Windows
                boundary.Width = WindowToStyle[boundary.RelatedBuildingElement][1]
                boundary.Height = WindowToStyle[boundary.RelatedBuildingElement][0]
            elif boundary.RelatedBuildingElement in [s.GlobalId for s in slabs]:  # Slabs
                Width = 0
                exp = OCC.Core.TopExp.TopExp_Explorer(boundary.Face, OCC.Core.TopAbs.TopAbs_EDGE)
                while exp.More():
                    edge = OCC.Core.TopoDS.topods.Edge(exp.Current())
                    exp_v = OCC.Core.TopExp.TopExp_Explorer(edge, OCC.Core.TopAbs.TopAbs_VERTEX)
                    edge_p = []
                    while exp_v.More():
                        edge_v = OCC.Core.TopoDS.topods.Vertex(exp_v.Current())
                        current_pnt = OCC.Core.BRep.BRep_Tool.Pnt(edge_v)
                        edge_p.append(current_pnt)
                        exp_v.Next()
                    vec_h = OCC.Core.gp.gp_Vec(edge_p[0], edge_p[1])
                    if Width < vec_h.Magnitude():
                        vec_ = vec_h
                        Width = vec_h.Magnitude()
                    exp.Next()
                Height = 0
                exp = OCC.Core.TopExp.TopExp_Explorer(boundary.Face, OCC.Core.TopAbs.TopAbs_EDGE)
                while exp.More():
                    edge = OCC.Core.TopoDS.topods.Edge(exp.Current())
                    exp_v = OCC.Core.TopExp.TopExp_Explorer(edge, OCC.Core.TopAbs.TopAbs_VERTEX)
                    edge_p = []
                    while exp_v.More():
                        edge_v = OCC.Core.TopoDS.topods.Vertex(exp_v.Current())
                        current_pnt = OCC.Core.BRep.BRep_Tool.Pnt(edge_v)
                        edge_p.append(current_pnt)
                        exp_v.Next()
                    vec_w = OCC.Core.gp.gp_Vec(edge_p[0], edge_p[1])
                    if abs(OCC.Core.gp.gp_Vec.Dot(vec_w, vec_)) <= 0.000001:
                        Height = max(Height, vec_w.Magnitude())
                    exp.Next()
                boundary.Width = Width
                boundary.Height = Height
            else:  # Walls
                Width = 0
                Height = 0
                exp = OCC.Core.TopExp.TopExp_Explorer(boundary.Face, OCC.Core.TopAbs.TopAbs_EDGE)
                while exp.More():
                    # There are probably easier ways to find directions etc
                    edge = OCC.Core.TopoDS.topods.Edge(exp.Current())
                    exp_v = OCC.Core.TopExp.TopExp_Explorer(edge, OCC.Core.TopAbs.TopAbs_VERTEX)
                    edge_p = []
                    while exp_v.More():
                        edge_v = OCC.Core.TopoDS.topods.Vertex(exp_v.Current())
                        current_pnt = OCC.Core.BRep.BRep_Tool.Pnt(edge_v)
                        edge_p.append(current_pnt)
                        exp_v.Next()
                    vec = OCC.Core.gp.gp_Vec(edge_p[0], edge_p[1])
                    vec_n = OCC.Core.gp.gp_Vec.Normalized(vec)
                    if 0.3 >= vec_n.Z() >= -0.3:
                        Width = max(Width, vec.Magnitude())
                    else:
                        Height = max(Height, vec.Magnitude())
                    exp.Next()
                boundary.Width = Width
                boundary.Height = Height
    return Spaces


def ExploreSurroundings(Spaces):
    """
    The correct 2nd and 3rd level boundaries where obtained (changed if necessary)
    by calling the function UpdateSecondLvLBoundaries. Once all the necessary
    changes on the boundaries are done the link between opposite boundaries,
    separated by some building element, can be defined.
    """
    props = OCC.Core.GProp.GProp_GProps()
    for sp in Spaces:
        for boundary in sp.Boundaries:
            vect = []
            for thick in boundary.thickness:
                vect.append(OCC.Core.gp.gp_Vec(boundary.Normal) * thick)
            T = OCC.Core.gp.gp_Trsf()
            for v in vect:  # Not sure whether normal is pointing in or out... need to move face in both directions!
                T.SetTranslation(v)
                Translated = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(boundary.Face, T).Shape()
                t_face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                    Translated, OCC.Core.TopAbs.TopAbs_FACE).Current())
                for sp2 in Spaces:
                    if sp.Space.GlobalId != sp2.Space.GlobalId:
                        for boundary2 in sp2.Boundaries:
                            cmon = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Common(t_face, boundary2.Face)
                            cmon_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cmon)
                            OCC.Core.BRepGProp.brepgprop_SurfaceProperties(cmon_shape, props)
                            if props.Mass() > 0:
                                boundary.OtherSideBoundary = boundary2.Id
    return Spaces


def CorrectThirdLevelBoundaries(Spaces, ifc_file, WallInfo, ColumnsInfo):
    """
    3rd level boundaries are stored into Boundaries. Some of them did not
    properly identify the element at the other side mainly because just faces
    where checked. Here volumes ares used to correct these missing connections.
    Thus boundaries which attribute OtherSideSpace is "Unknown" are considered.
    """
    walls = ifc_file.by_type("IfcWall")
    columns = ifc_file.by_type("IfcColumn")
    boundaryIdGen = 1
    Spaces_new = []
    for sp in Spaces:
        new_boundaries = []
        for b in sp.Boundaries:
            if b.OtherSideSpace == "Unknown":
                new_shapes = []
                vect = []
                for thick in b.thickness:
                    vect.append(OCC.Core.gp.gp_Vec(b.Normal) * (abs(thick)))
                T = OCC.Core.gp.gp_Trsf()
                for v in vect:
                    # Normals suppose to be corrected.
                    # For some building elements is but the thickness not clear.
                    T.SetTranslation(v)
                    Translated = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(b.Face, T).Shape()
                    t_face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                        Translated, OCC.Core.TopAbs.TopAbs_FACE).Current())
                    for w in walls:
                        if w.GlobalId in list(WallInfo.keys()):
                            if w.GlobalId != b.RelatedBuildingElement:
                                shape = ifcopenshell.geom.create_shape(settings, w).geometry
                                cmn_shape, area, BuilderCanWork = commonFace_andArea(t_face, shape)
                                if area > 0:  # There is a common part!
                                    T.SetTranslation(-v)
                                    b_cmon = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(
                                        cmn_shape, T).Shape()
                                    b_cmonFace = OCC.Core.TopoDS.topods.Face(
                                        OCC.Core.TopExp.TopExp_Explorer(
                                            b_cmon, OCC.Core.TopAbs.TopAbs_FACE).Current())
                                    new_shapes.append([b_cmonFace, area, b.Normal, w.GlobalId])
                    for w in columns:
                        if w.GlobalId in list(ColumnsInfo.keys()):
                            if w.GlobalId != b.RelatedBuildingElement:
                                shape = ifcopenshell.geom.create_shape(settings, w).geometry
                                cmn_shape, area, BuilderCanWork = commonFace_andArea(t_face, shape)
                                if area > 0:  # There is a common part!
                                    T.SetTranslation(-v)
                                    b_cmon = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(
                                        cmn_shape, T).Shape()
                                    b_cmonFace = OCC.Core.TopoDS.topods.Face(
                                        OCC.Core.TopExp.TopExp_Explorer(
                                            b_cmon, OCC.Core.TopAbs.TopAbs_FACE).Current())
                                    new_shapes.append([b_cmonFace, area, b.Normal, w.GlobalId])
                if new_shapes:  # We found common parts
                    RemainingF = b.Face
                    for element in new_shapes:
                        B = IfcLib.DataClasses.BoundaryContainer(element[0], element[1], element[2])
                        B.RelatedBuildingElement = b.RelatedBuildingElement
                        B.OtherSideSpace = str(element[3])
                        B.thickness = b.thickness
                        B.Id = "B" + str(boundaryIdGen) + "_" + sp.Space.GlobalId + "_" + str(b.RelatedBuildingElement)
                        boundaryIdGen = boundaryIdGen + 1
                        new_boundaries.append(B)
                        RemainingF = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Cut(RemainingF, element[0])
                        RemainingF = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(RemainingF)
            else:  # Keep other (not unknown) boundaries!
                new_boundaries.append(b)
        spC = IfcLib.DataClasses.SpaceContainer(
            sp.Space,
            new_boundaries,
            sp.Volume,
            sp.RelatedWall,
            sp.RelatedOpening,
            sp.RelatedSlab,
            sp.RelatedSpace,
            sp.RelatedColumn)
        Spaces_new.append(spC)
    return Spaces_new


def StoreEnclosedBoundaries(Spaces, WallInfo, OpeningsDict):
    """
    Add the id's of included space boundaries to their related space boundaries
    """
    for sp in Spaces:
        for b in sp.Boundaries:
            if b.RelatedBuildingElement in WallInfo.keys() and (len(b.GapsProfile)>0 or len(b.Profile)>4):
                for o in OpeningsDict.values():
                    if o[2][0] in b.Id:
                        for b2 in sp.Boundaries:
                            if o[1][0] in b2.Id:
                                b.IncludedBoundariesIds.append(b2.Id)
    return Spaces


def CorrectNormalVector(Spaces):
    """
    The correct definition of the normal vector of the spaces boundaries are checked for every space.
    Normal should point out of the volume. Any normal pointing inside is inverted.
    """
    # NEED TO CORRECT! NOT ALWAYS WORKING!
    props = OCC.Core.GProp.GProp_GProps()
    for sp in Spaces:
        volume_shape = ifcopenshell.geom.create_shape(settings, sp.Space).geometry
        for b in sp.Boundaries:
            exp = OCC.Core.TopExp.TopExp_Explorer(b.Face, OCC.Core.TopAbs.TopAbs_VERTEX)
            vertex = OCC.Core.TopoDS.topods.Vertex(exp.Current())
            # GET A POINT OF THE BOUNDARY FACE
            pnt = OCC.Core.BRep.BRep_Tool.Pnt(vertex)
            # CREATE TWO EDGES USING THE POINT AND NORMAL VECTOR (+ AND -)
            edge1 = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeEdge(
                pnt,
                OCC.Core.gp.gp_Pnt(
                    pnt.X() +
                    b.Normal.X() *
                    0.01,
                    pnt.Y() +
                    b.Normal.Y() *
                    0.01,
                    pnt.Z() +
                    b.Normal.Z() *
                    0.01)).Edge()
            edge2 = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeEdge(
                pnt,
                OCC.Core.gp.gp_Pnt(
                    pnt.X() -
                    b.Normal.X() *
                    0.01,
                    pnt.Y() -
                    b.Normal.Y() *
                    0.01,
                    pnt.Z() -
                    b.Normal.Z() *
                    0.01)).Edge()
            # Obtain common part of edges and space volume
            cmn = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Common(volume_shape, edge1)
            cmn_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cmn)
            OCC.Core.BRepGProp.brepgprop_LinearProperties(cmn_shape, props)
            m1 = props.Mass()
            cmn = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Common(volume_shape, edge2)
            cmn_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cmn)
            OCC.Core.BRepGProp.brepgprop_LinearProperties(cmn_shape, props)
            m2 = props.Mass()
            if m1 >= 0.0005:  # Common part for edge1 (normal +) found.
                if m2 >= 0.0005:  # Common part for edge2 (normal -) found.
                    # Thus we have a closed angle (like an "L"). Further checks are necessary
                    # Boundary face is moved in normal direction and common face with space volume is obtained
                    # and evaluated.
                    v = OCC.Core.gp.gp_Vec(b.Normal) * 0.01
                    T = OCC.Core.gp.gp_Trsf()
                    T.SetTranslation(v)
                    Translated = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Transform(b.Face, T).Shape()
                    t_face = OCC.Core.TopoDS.topods.Face(OCC.Core.TopExp.TopExp_Explorer(
                        Translated, OCC.Core.TopAbs.TopAbs_FACE).Current())
                    cmon = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Common(t_face, volume_shape)
                    cmon_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cmon)
                    OCC.Core.BRepGProp.brepgprop_SurfaceProperties(cmon_shape, props)
                    if props.Mass() >= b.Area * 0.9:
                        # Common face is found (normal pointing into the volume). Invert it
                        b.Normal.SetX(-b.Normal.X())
                        b.Normal.SetY(-b.Normal.Y())
                        b.Normal.SetZ(-b.Normal.Z())
                else:  # Common part for edge2 (normal -) NOT found. Invert it: Normal should point out!
                    b.Normal.SetX(-b.Normal.X())
                    b.Normal.SetY(-b.Normal.Y())
                    b.Normal.SetZ(-b.Normal.Z())
                vec = OCC.Core.gp.gp_Vec(b.Normal)
    return Spaces


def getOverlappedelements(ifc_file, walls):
    """
    Function created to detect overlap between elements. (Currently not used)
    """
    props = OCC.Core.GProp.GProp_GProps()
    spaces = ifc_file.by_type("IfcSpace")
    slabs = ifc_file.by_type("IfcSlab")
    overlappedId = {}
    overlappedShape = {}
    local_tolerance = 0.1
    for sp in spaces:
        if sp.GlobalId == "3A3GLqqUb4Yf$ykM7$jQ_C":
            elementsId = []
            elementsShape = []
            current_space = ifcopenshell.geom.create_shape(settings, sp).geometry
            OCC.Core.BRepGProp.brepgprop_VolumeProperties(current_space, props)
            Space_Volume = props.Mass()
            for element in slabs:
                current = ifcopenshell.geom.create_shape(settings, element).geometry
                cut = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Cut(current_space, current)
                if cut.BuilderCanWork():
                    cut_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cut)
                    OCC.Core.BRepGProp.brepgprop_VolumeProperties(cut_shape, props)
                    if props.Mass() + local_tolerance < Space_Volume:
                        elementsId.append(element.GlobalId)
                        elementsShape.append(current)
            for element in walls:
                current = ifcopenshell.geom.create_shape(settings, element).geometry
                cut = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Cut(current_space, current)
                if cut.BuilderCanWork():
                    cut_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cut)
                    OCC.Core.BRepGProp.brepgprop_VolumeProperties(cut_shape, props)
                    if props.Mass() + local_tolerance < Space_Volume:
                        elementsId.append(element.GlobalId)
                        elementsShape.append(current)
            for element in spaces:
                current = ifcopenshell.geom.create_shape(settings, element).geometry
                cut = OCC.Core.BRepAlgoAPI.BRepAlgoAPI_Cut(current_space, current)
                if cut.BuilderCanWork():
                    cut_shape = OCC.Core.BRepBuilderAPI.BRepBuilderAPI_MakeShape.Shape(cut)
                    OCC.Core.BRepGProp.brepgprop_VolumeProperties(cut_shape, props)
                    if props.Mass() + local_tolerance < Space_Volume:
                        elementsId.append(element.GlobalId)
                        elementsShape.append(current)
                else:
                    pass
            overlappedId[sp.GlobalId] = elementsId
            overlappedShape[current_space] = elementsShape
    return overlappedId, overlappedShape


def getOverlappedSpaces(ifc_file):
    """
    Function created to detect overlap spaces
    """
    props = OCC.Core.GProp.GProp_GProps()
    spaces = ifc_file.by_type("IfcSpace")
    black_list = []
    local_tolerance = 0.1
    shapes = {}
    for sp in spaces:
        shapes[str(sp.GlobalId)] = ifcopenshell.geom.create_shape(settings, sp).geometry

    for key1 in shapes:
        current = shapes[key1]
        OCC.Core.BRepGProp.brepgprop_VolumeProperties(current, props)
        Space_Volume = props.Mass()
        for key2 in shapes:
            if key1 != key2:
                sh, area, BuilderCanWork = CuttedShape(current, shapes[key2])
                # For some unknow reason the operation the cut-operation will not work.
                # I think the operation can just be perform if the geometry that cuts the other is simple.
                # It means geometry that has to be cut can be "complex" the other one not.
                # If buildercanwork == False we pass and wait for the loop to twist the order
                OCC.Core.BRepGProp.brepgprop_VolumeProperties(sh, props)
                vol = props.Mass()
                if round(vol, 5) != round(Space_Volume, 5):
                    OCC.Core.BRepGProp.brepgprop_VolumeProperties(shapes[key2], props)
                    if Space_Volume > props.Mass() and key1 not in black_list:
                        black_list.append(key1)
                        # print("1: ", key1, " 2: ", key2, " ... ", Space_Volume, " != ", vol )
    return black_list


def Profiles(Spaces):
    """
    Function used to update attributes "Profile" and "GapsProfile". Space Boundaries (faces) are
    rebuilded. RebuildFace returns, a rebuilded face as well as a two list containing a list points
    that defined the main face and faces of any gap present in the boundary.
    """
    for sp in Spaces:
        for b in sp.Boundaries:
            shape, profile, gaps = RebuildFace(b.Face)
            b.Profile = profile
            b.GapsProfile = gaps
    return Spaces


def arePointsEqual(pnt1, pnt2):
    """
    Return True if pnt1 and pnt2 have identical X, Y and Z coordinates
    """
    return pnt1.X() == pnt2.X() and pnt1.Y() == pnt2.Y() and pnt1.Z() == pnt2.Z()


def isPointInList(pnt1, pnt_list):
    """
    Compare pnt1 with each point in pnt_list. Return True if a
    point with the same X, Y and Z coordiantes is found.
    """
    for pnt2 in pnt_list:
        if arePointsEqual(pnt1, pnt2):
            return True
    return False
