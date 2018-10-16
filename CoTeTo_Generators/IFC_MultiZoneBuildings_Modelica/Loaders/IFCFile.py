#-*- coding:utf-8 -*-
#
# This file is part of CoTeTo - a code generation tool
# 201701122 Christoph Nytsch-Geusen nytsch@udk-berlin.de
#
from CoTeTo.Loader import Loader
from os.path import isfile
import ifcopenshell

class IFCFile(Loader):
    name = 'IFCFile'
    description = 'IFC file loader for CoTeTo'
    version = '1.0'
    author = 'Christoph Nytsch-Geusen  nytsch@udk-berlin.de'
    helptxt = """Load IFC files, returns ifcOpenShell objects"""

    def load(self, uriList):
        data = {}
        for u in uriList:
            if isfile(u):
                self.logger.info('IFCFile - loading %s', u)
                data[u] = {"IfcData":ifcopenshell.open(str(u))}
            else:
                data[u] = None
                self.logger.error('IFCFile - file not readable %s', u)
        return data
