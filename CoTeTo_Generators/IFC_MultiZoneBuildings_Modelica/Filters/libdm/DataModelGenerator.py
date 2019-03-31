## Classes for storing the information of the building model instances
class Construction:
    def __init__(self, name, nLayers = 1, thickness = [], material = []):
        self.name = name
        self.nLayers = nLayers
        self.thickness = thickness
        self.material = material

class Zone:
    def __init__(self, name, pos, nElements, nWalls, nSlabs, nDoors, nWindows, volume, height, TSetHeating, TSetCooling, airchange, heatsource):
        self.name = name
        self.pos = pos
        self.nElements = nElements
        self.nWalls = nWalls,
        self.nSlabs = nSlabs,
        self.nDoors = nDoors,
        self.nWindows = nWindows,
        self.volume = volume
        self.height = height
        self.TSetHeating = TSetHeating
        self.TSetCooling = TSetCooling
        self.airchange = airchange
        self.heatsource = heatsource

class Element:
    def __init__(self, name, pos, memberOfZone, angleDegAzi, angleDegTil, height, width, thickness, mesh):
        self.name = name
        self.pos = pos
        self.memberOfZone = memberOfZone
        self.angleDegAzi = angleDegAzi
        self.angleDegTil = angleDegTil
        self.height = height
        self.width = width
        self.thickness = thickness
        self.mesh = mesh

class ElementOpaque(Element):
    def __init__(self, name, pos, memberOfZone, angleDegAzi, angleDegTil, height, width, thickness, mesh, constructionData, AInnSur, includedWindows, includedDoors):
        Element.__init__(self, name, pos, memberOfZone, angleDegAzi, angleDegTil, height, width, thickness, mesh)
        self.constructionData = constructionData
        self.AInnSur = AInnSur
        self.includedWindows=includedWindows
        self.includedDoors=includedDoors

class ElementTransparent(Element):
    def __init__(self, name, pos, memberOfZone, angleDegAzi, angleDegTil, height, width, thickness, mesh):
        Element.__init__(self, name, pos, memberOfZone, angleDegAzi, angleDegTil, height, width, thickness, mesh)

class ElementDoor(Element):
    def __init__(self, name, pos, memberOfZone, angleDegAzi, angleDegTil, height, width, thickness, mesh, constructionData, AInnSur):
        Element.__init__(self, name, pos, memberOfZone, angleDegAzi, angleDegTil, height, width, thickness, mesh)
        self.constructionData = constructionData
        self.AInnSur = AInnSur

class ConnectionElementZone:
    def __init__(self, element, elementPort, zone, zonePort):
        self.element = element
        self.elementPort = elementPort
        self.zone = zone
        self.zonePort = zonePort

class ConnectionElementAmbient:
    def __init__(self, element, elementPort, ambientPort):
        self.element = element
        self.elementPort = elementPort
        self.ambientPort = ambientPort

class ConnectionElementSolid:
    def __init__(self, element, elementPort, solidPort):
        self.element = element
        self.elementPort = elementPort
        self.solidPort = solidPort

class BuildingSystem:
    def __init__(self, name = "BuildingSystem", location = "", originalWalls = [], originalDoors = [], originalSlabs = [], originalWindows = []):
        self.name = name
        self.location = location
        self.originalWalls = originalWalls
        self.originalDoors = originalDoors
        self.originalSlabs = originalSlabs
        self.originalWindows = originalWindows
