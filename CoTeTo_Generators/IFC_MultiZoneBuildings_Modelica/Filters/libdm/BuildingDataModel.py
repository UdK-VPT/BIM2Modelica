#!/usr/bin/python
import OCC.Core.gp

class Geometry3D:
    '''
    This class describes the properties of 3D geometry object.
    '''

    def __init__(self, name='', pos=(0.0, 0.0, 0.0)):
        self.name = str(name)
        self.pos = OCC.Core.gp.gp_Pnt(pos[0], pos[1], pos[2])


class Material:
    '''
    This class describes the thermal properties of a material.
    '''
    att = ('name',
           'density',
           'capacity',
           'conductivity')

    def __init__(self, name='', **kwargs):
        self.name = name
        self.density = None
        self.capacity = None
        self.conductivity = None
        self.setParameter(**kwargs)

    def setParameter(self, **kwargs):
        if kwargs is not None:
            for k in kwargs:
                if k in Material.att:
                    setattr(self, k, kwargs[k])
                else:
                    raise TypeError(k, 'is an unknown parameter')


class Construction:
    '''
    This class describes the properties of multi-layered construction.
    '''
    att = ('name',
           'numberOfLayers',
           'thickness',
           'material')

    def __init__(self, name='', **kwargs):
        self.name = str(name)
        self.numberOfLayers = None
        self.thickness = None
        self.material = None
        self.setParameter(**kwargs)

    def setParameter(self, **kwargs):
        if kwargs is not None:
            for k in kwargs:
                if k in Construction.att:
                    setattr(self, k, kwargs[k])
                else:
                    raise TypeError(k, 'is an unknown parameter')


class BuildingElement:
    '''
    This class describes the properties of a general building element.
    '''
    att = ['id',
           'name',
           'pos',
           'angleDegAzi',
           'angleDegTil',
           'adjZoneSide1',
           'adjZoneSide2',
           'geometry',
           'width',
           'height',
           'areaNet',
           'thickness',
           'mesh']

    def __init__(self, id, name, pos, **kwargs):
        self.id = str(id)
        self.name = str(name)
        self.pos = OCC.Core.gp.gp_Pnt(pos[0], pos[1], pos[2])
        self.angleDegAzi = None
        self.angleDegTil = None
        self.adjZoneSide1 = None
        self.adjZoneSide2 = None
        self.geometry = None
        self.width = None
        self.height = None
        self.areaNet = None
        self.thickness = None
        self.mesh = None

    def setParameter(self, **kwargs):
        if kwargs is not None:
            for k in kwargs:
                if k in BuildingElement.att:
                    setattr(self, k, kwargs[k])
                else:
                    raise TypeError(k, 'is an unknown parameter')


class BuildingElementOpaque(BuildingElement):
    '''
    This class describes the properties of an opaque building element.
    '''

    def __init__(self, id = '', name='', pos=(0.0, 0.0, 0.0), **kwargs):
        BuildingElement.__init__(self, id, name, pos, **kwargs)
        BuildingElement.att.append('constructionData')
        BuildingElement.att.append('includedWindows')
        BuildingElement.att.append('includedDoors')
        self.constructionData = None
        self.includedWindows = None
        self.includedDoors = None
        self.setParameter(**kwargs)


class BuildingElementTransparent(BuildingElement):
    '''
    This class describes the properties of a transparent building element.
    '''

    def __init__(self, id = '', name='', pos=(0.0, 0.0, 0.0), **kwargs):
        BuildingElement.__init__(self, id, name, pos, **kwargs)
        self.setParameter(**kwargs)

class BuildingElementDoor(BuildingElement):
    '''
    This class describes the properties of a door building element.
    '''

    def __init__(self, id='', name='', pos=(0.0, 0.0, 0.0), **kwargs):
        BuildingElement.__init__(self, id, name, pos, **kwargs)
        BuildingElement.att.append('constructionData')
        self.constructionData = None
        self.setParameter(**kwargs)

class BuildingZone:
    '''
    This class describes the properties of a thermal building zone.
    '''
    att = ('id',
           'name',
           'pos',
           'volume',
           'height',
           'geometry',
           'numberOfElements',
           'numberOfWalls',
           'numberOfSlabs',
           'numberOfDoors',
           'numberOfWindows',
           'TSetHeating',
           'TSetCooling',
           'airchange',
           'thermalLoads')

    def __init__(self, id='', name='', pos=(0.0, 0.0, 0.0), **kwargs):
        self.id = str(id)
        self.name = str(name)
        self.pos = OCC.Core.gp.gp_Pnt(pos[0], pos[1], pos[2])
        self.volume = None
        self.height = None
        self.geometry = None
        self.numberOfElements = None
        self.numberOfWalls = None
        self.numberOfSlabs = None
        self.numberOfDoors = None
        self.numberOfWindows = None
        self.TSetHeating = None
        self.TSetCooling = None
        self.airchange = None
        self.thermalLoads = None
        self.setParameter(**kwargs)

    def setParameter(self, **kwargs):
        if kwargs is not None:
            for k in kwargs:
                if k in BuildingZone.att:
                    setattr(self, k, kwargs[k])
                else:
                    raise TypeError(k, 'is an unknown parameter')


class Building:
    '''
    This class describes the properties of a thermal building.
    '''
    att = ('id',
           'name',
           'longitude',
           'latitude',
           'levelOverSea',
           'zones',
           'originalWalls',
           'originalDoors',
           'originalSlabs',
           'originalWindows',
           'opaqueElements',
           'transparentElements',
           'doorElements',
           'constructions',
           'UValFac',
           'UValRoo',
           'UValGro',
           'UValWin',
           'fWin',
           'length',
           'width',
           'heightSto',
           'nSto',
           'thermalLoads')

    def __init__(self, id='', name='', pos=(0.0, 0.0, 0.0), **kwargs):
        self.id = str(id)
        self.name = str(name)
        self.longitude = pos[0]
        self.latitude = pos[1]
        self.levelOverSea = pos[2]
        # 1D and 3 D modelling approach
        self.zones = []
        self.originalWalls = []
        self.originalDoors = []
        self.originalSlabs = []
        self.originalWindows = []
        self.opaqueElements = []
        self.transparentElements = []
        self.doorElements = []
        self.constructions = []
        # 0D modelling approach
        self.UValFac = None
        self.UValRoo = None
        self.UValGro = None
        self.UValWin = None
        self.fWin = None
        self.length = None
        self.width = None
        self.heightSto = None
        self.nSto = None
        self.thermalLoads = None
        self.setParameter(**kwargs)

    def addOriginalWall(self, originalWall):
        self.originalWalls.append(originalWall)

    def addOriginalDoor(self, originalDoor):
        self.originalDoors.append(originalDoor)

    def addOriginalSlab(self, originalSlab):
        self.originalSlabs.append(originalSlab)

    def addOriginalWindow(self, originalWindow):
        self.originalWindows.append(originalWindow)

    def addConstruction(self, construction):
        self.constructions.append(construction)

    def addZone(self, zone):
        self.zones.append(zone)

    def addOpaqueElement(self, opaqueElement):
        self.opaqueElements.append(opaqueElement)

    def addTransparentElement(self, transparentElement):
        self.transparentElements.append(transparentElement)

    def addDoorElement(self, doorElement):
        self.doorElements.append(doorElement)

    def setParameter(self, **kwargs):
        if kwargs is not None:
            for k in kwargs:
                if k in Building.att:
                    setattr(self, k, kwargs[k])
                else:
                    raise TypeError(k, 'is an unknown parameter')

    def getParameter(self, value=''):
        if value in Building.att:
            if value == 'name':
                return self.name
            if value == 'longitude':
                return self.longitude
            if value == 'latitude':
                return self.latitude
            if value == 'levelOverSea':
                return self.levelOverSea
            # 1D and 3 D modelling approach
            if value == 'zones':
                return self.zones
            if value == 'originalWalls':
                return self.originalWalls
            if value == 'originalDoors':
                return self.originalDoors
            if value == 'originalSlabs':
                return self.originalSlabs
            if value == 'originalWindows':
                return self.originalWindows
            if value == 'opaqueElements':
                return self.opaqueElements
            if value == 'transparentElements':
                return self.transparentElements
            if value == 'doorElements':
                return self.doorElements
            if value == 'constructions':
                return self.constructions
            # 0D modelling approach
            if value == 'UValFac':
                if self.UValFac is None:
                    self.UValFac = 1.0
                return self.UValFac
            if value == 'UValRoo':
                if self.UValRoo is None:
                    self.UValRoo = 1.0
                return self.UValRoo
            if value == 'UValGro':
                if self.UValGro is None:
                    self.UValGro = 1.0
                return self.UValGro
            if value == 'UValWin':
                if self.UValWin is None:
                    self.UValWin = 1.0
                return self.UValWin
            if value == 'fWin':
                if self.fWin is None:
                    self.fWin = 0.3
                return self.fWin
            if value == 'length':
                if self.length is None:
                    self.length = 1.0
                return self.length
            if value == 'width':
                if self.width is None:
                    self.width = 1.0
                return self.width
            if value == 'heightSto':
                if self.heightSto is None:
                    self.heightSto = 2.8
                return self.heightSto
            if value == 'nSto':
                if self.nSto is None:
                    self.nSto = 1
                return self.nSto
            if value == 'thermalLoads':
                if self.thermalLoads is None:
                    self.thermalLoads = 0.0
                return self.thermalLoads
        else:
            raise TypeError(value, 'is an unknown parameter')

    def getElementZoneRelations(self):
        d = {}
        for element in self.opaqueElements:
            if element.adjZoneSide1 not in ['AMB', 'GRO', None]:
                if element.adjZoneSide1 in d:
                    d[element.adjZoneSide1].append((element.name, '1'))
                else:
                    d[str(element.adjZoneSide1)] = [(element.name, '1')]
            if element.adjZoneSide2 not in ['AMB', 'GRO', None]:
                if element.adjZoneSide2 in d:
                    d[element.adjZoneSide2].append((element.name, '2'))
                else:
                    d[str(element.adjZoneSide2)] = [(element.name, '2')]
        for element in self.transparentElements:
            if element.adjZoneSide1 not in ['AMB', 'GRO', None]:
                if element.adjZoneSide1 in d:
                    d[element.adjZoneSide1].append((element.name, '1'))
                else:
                    d[str(element.adjZoneSide1)] = [(element.name, '1')]
            if element.adjZoneSide2 not in ['AMB', 'GRO', None]:
                if element.adjZoneSide2 in d:
                    d[element.adjZoneSide2].append((element.name, '2'))
                else:
                    d[str(element.adjZoneSide2)] = [(element.name, '2')]
        for element in self.doorElements:
            if element.adjZoneSide1 not in ['AMB', 'GRO', None]:
                if element.adjZoneSide1 in d:
                    d[element.adjZoneSide1].append((element.name, '1'))
                else:
                    d[str(element.adjZoneSide1)] = [(element.name, '1')]
            if element.adjZoneSide2 not in ['AMB', 'GRO', None]:
                if element.adjZoneSide2 in d:
                    d[element.adjZoneSide2].append((element.name, '2'))
                else:
                    d[str(element.adjZoneSide2)] = [(element.name, '2')]
        return d

    def getElementAmbientRelations(self):
        l = []
        for element in self.opaqueElements:
            if element.adjZoneSide1 == 'AMB':
                l.append((element.name, '1'))
            if element.adjZoneSide2 == 'AMB':
                l.append((element.name, '2'))
        for element in self.transparentElements:
            if element.adjZoneSide1 == 'AMB':
                l.append((element.name, '1'))
            if element.adjZoneSide2 == 'AMB':
                l.append((element.name, '2'))
        for element in self.doorElements:
            if element.adjZoneSide1 == 'AMB':
                l.append((element.name, '1'))
            if element.adjZoneSide2 == 'AMB':
                l.append((element.name, '2'))
        return l

    def getElementGroundRelations(self):
        l = []
        for element in self.opaqueElements:
            if element.adjZoneSide1 == 'GRO':
                l.append((element.name, '1'))
            if element.adjZoneSide2 == 'GRO':
                l.append((element.name, '2'))
        for element in self.transparentElements:
            if element.adjZoneSide1 == 'GRO':
                l.append((element.name, '1'))
            if element.adjZoneSide2 == 'GRO':
                l.append((element.name, '2'))
        for element in self.doorElements:
            if element.adjZoneSide1 == 'GRO':
                l.append((element.name, '1'))
            if element.adjZoneSide2 == 'GRO':
                l.append((element.name, '2'))
        return l


class District:
    '''
    This class describes the properties of a district.
    '''
    att = ('name',
           'longitude',
           'latitude',
           'levelOverSea',
           'buildings')

    def __init__(self, name='', pos=(0.0, 0.0, 0.0), **kwargs):
        self.name = str(name)
        self.longitude = pos[0]
        self.latitude = pos[1]
        self.levelOverSea = pos[2]
        self.buildings = []
        self.setParameter(**kwargs)

    def addBuilding(self, building):
        self.buildings.append(building)

    def setParameter(self, **kwargs):
        if kwargs is not None:
            for k in kwargs:
                if k in District.att:
                    setattr(self, k, kwargs[k])
                else:
                    raise TypeError(k, 'is an unknown parameter')

    def getParameter(self, value=''):
        if value in District.att:
            if value == 'name':
                return self.name
            if value == 'longitude':
                return self.longitude
            if value == 'latitude':
                return self.latitude
            if value == 'levelOverSea':
                return self.levelOverSea
            if value == 'buildings':
                return self.buildings
        else:
            raise TypeError(value, 'is an unknown parameter')
