#!/usr/bin/env python3

import sys
import os
os.mkdir('./generatedCode')
os.chdir('./generatedCode')

sys.path.append("../../../../CoTeTo")

from CoTeTo.Controller import Controller

# CoTeTo-Controller initialisieren
# optionale Argumente: Liste von Generator-Suchpfaden, LogLevel (0, 10, 20 ...50)
con = Controller()

# Generator aus Dict auswählen
# Liste mit: print(con.generators.keys())
gen = con.generators['IFC_MultiZoneBuildings_Modelica::0.2']

# ... und ausführen. Argumente: Liste von Inputs, Output(-präfix)
files = [
('OneZone.ifc','OneZone'),
('TwoZones.ifc','TwoZones'),
('MultiZoneBuilding.ifc','MultiZoneBuilding'),
('RooftopBuilding3ZonesThin.ifc','RooftopBuilding3ZonesThin'),
#('RooftopBuilding4ZonesThin.ifc','RooftopBuilding4ZonesThin')
]
for f in files:
    gen.execute(('../'+f[0], ), f[1])
