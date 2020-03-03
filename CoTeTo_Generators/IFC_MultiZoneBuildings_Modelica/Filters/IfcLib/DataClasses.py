# -*- coding: utf-8 -*-

import OCC.Core.gp

class Layer(object):
    '''
    This class is used to define a construction layer.
    '''

    def __init__(self, Id, Material, Thickness):
        self.Id = Id  # Id/number on file, #66715= IFCMATERIALLAYER(...
        self.Material = Material  # Material name
        self.Thickness = Thickness  # Thickness in mm -> change it?


'''
LayerSet are stored into a dictionary with key = Id and value = list of elements of the class <Layer>
'''


class SpaceContainer(object):
    '''
    This class contains the instance of the original IfcSpace and a list of boundaries.
    as well as the attribute Volume.
    '''

    def __init__(
            self,
            IfcSpace,
            Boundaries=[],
            Volume=0,
            RelatedWall={},
            RelatedOpening={},
            RelatedSlab={},
            RelatedSpace={},
            RelatedColumn={},
            RelatedVirtual=[]):
        self.Space = IfcSpace  # Instance of the IfcSpace
        self.Boundaries = Boundaries  # List of elements of the class <BoundaryContainer>
        self.Volume = Volume
        self.RelatedWall = RelatedWall  # Dictionary with key = RefId of IfcWall and Value = TopoDS_Shape of the wall
        # Dictionary with key = RefId of IfcOpeningElement and Value = TopoDS_Shape
        self.RelatedOpening = RelatedOpening
        self.RelatedSlab = RelatedSlab
        self.RelatedSpace = RelatedSpace
        self.RelatedColumn = RelatedColumn
        self.RelatedVirtual = RelatedVirtual
        self.SurroundingSpaces = []  # Not used so far...
        self.Position = OCC.Core.gp.gp_Pnt(0, 0, 0)


class BoundaryContainer(object):
    '''
    This class contains the instance of the Shape (OCC), an identification number Id,
    the Id of the element attached (IfcWall, IfcWindow...), Id of the space and boundary
    at the other side of the element attached and the attribute Area (for easy access).
    '''

    def __init__(self, Face, area=0, normal=0):
        self.Id = ""  # Automatic generated Identification for the BoundaryContainer instance.
        self.IncludedBoundariesIds = [] # List of the Id's of the included boundaries
        self.Face = Face  # TopoDS_Face of the Boundary
        # RefId of the Neighbour Space (IfcSpace), BuildingElement
        # (IfcWall,IfcSlab, ...) or 'EXTERNAL'
        self.OtherSideSpace = ""
        # If Neighbour Space, equal to Id of the corresponding Boundary
        # (BoundaryContainer.Id). Else: '' (empty)
        self.OtherSideBoundary = ""
        # RefId of the related element (IfcWall, IfcDoor, IfcWindow, ...)
        self.RelatedBuildingElement = ""
        self.thickness = [0]  # Thickness of the wall (also for windows and doors!, ...)
        self.Area = area  # Area in m2
        self.Normal = normal  # Normal vector (gp_Dir class). Normal should point out of the volume
        self.Position = OCC.Core.gp.gp_Pnt(0, 0, 0)
        self.Height = 0
        self.Width = 0
        self.Profile = []  # Ordered points of the the outer profile of the boundary face.
        self.GapsProfile = []  # If gap is present, list/s with ordered points of face profile of gaps in the boundary face


class Mesh(object):
    def __init__(self, shape):
        from OCC.Core.BRep import BRep_Tool
        from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
        from OCC.Core.TopAbs import TopAbs_FACE, TopAbs_VERTEX
        from OCC.Core.TopExp import TopExp_Explorer
        from OCC.Core.TopLoc import TopLoc_Location
        from OCC.Core.TopoDS import topods_Face, topods_Vertex, TopoDS_Iterator

        vertices = []  # a (nested) list of vec3
        triangles = []  # a (flat) list of integers
        normals = []
        uv = []

        # Mesh the shape
        linDeflection = 0.8
        BRepMesh_IncrementalMesh(shape, linDeflection)
        bt = BRep_Tool()

        # Explore the faces of the shape
        # each face is triangulated, we need to collect all the parts
        expFac = TopExp_Explorer(shape, TopAbs_FACE)
        while expFac.More():
            face = topods_Face(expFac.Current())
            location = TopLoc_Location()
            facing = (bt.Triangulation(face, location))
            try:
                tri = facing.Triangles()
                nTri = facing.NbTriangles()
                ver = facing.Nodes()
            except:
                tri = None
                nTri= None
                ver = None
            # store origin of the face's local coordinates
            transf = face.Location().Transformation()

            # iterate over triangles and store indices of vertices defining each triangle
            # OCC uses one-based indexing
            for i in range(1, nTri + 1):
                # each triangle is defined by three points
                # each point is defined by its index in the list of vertices
                index1, index2, index3 = tri.Value(i).Get()
                indices = [index1, index2, index3]

                # python uses zero-based indexing
                # for each vertex of a triangle, check whether it is already known
                # then store it (or not) and update the index
                for idx in [0, 1, 2]:
                    # read global coordinates of each point
                    vec3 = [ver.Value(indices[idx]).Transformed(transf).X(), ver.Value(indices[idx]).Transformed(transf).Y(), ver.Value(indices[idx]).Transformed(transf).Z()]
                    if vec3 not in vertices:
                        vertices.append(vec3)
                    indices[idx] = vertices.index(vec3)
                triangles.extend(indices)
            expFac.Next()

        self.shape = shape
        self.vertices = vertices
        self.triangles = triangles
        self.normals = normals
        self.uv = uv
