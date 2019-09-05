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
('AWS-1_SB.ifc','AWS1_SB'),
('AWS-2_SB.ifc','AWS2_SB'),
('AWS-3_SB.ifc','AWS3_SB'),
('AWS-4_SB.ifc','AWS4_SB'),
('AWS-5_SB.ifc','AWS5_SB'),
('CSC-1_SB.ifc','CSC1_SB'),
('CSC-2_SB.ifc','CSC2_SB'),
('CSC-3_SB.ifc','CSC3_SB'),
('CSC-4_SB.ifc','CSC4_SB'),
('CSC-5_SB.ifc','CSC5_SB'),
('CSC-6_SB.ifc','CSC6_SB'),
('CSC-7_SB.ifc','CSC7_SB'),
('CSO-1_SB.ifc','CSO1_SB'),
('CSO-2_SB.ifc','CSO2_SB'),
('CSO-3_SB.ifc','CSO3_SB'),
('CSW-1_SB.ifc','CSW1_SB'),
('CSW-3_SB.ifc','CSW3_SB'),
('CSW-4_SB.ifc','CSW4_SB'),
('CSW-8_SB.ifc','CSW8_SB'),
('SOAW-1_SB.ifc','SOAW1_SB'),
('SOAW-3_SB.ifc','SOAW3_SB'),
('SOWW-1_SB.ifc','SOWW1_SB'),
('SOWW-2_SB.ifc','SOWW2_SB'),
('SOWW-3_SB.ifc','SOWW3_SB'),
('SWW-3_SB.ifc','SWW3_SB'),
('SWW-4_SB.ifc','SWW4_SB'),
('SWW-5_SB.ifc','SWW5_SB'),
('Wi-1_SB.ifc','Wi1_SB'),
('Wi-3_SB.ifc','Wi3_SB'),
('Wi-4_SB.ifc','Wi4_SB'),
('Wi-5_SB.ifc','Wi5_SB'),
('Wi-6_SB.ifc','Wi6_SB'),
('Wi-7_SB.ifc','Wi7_SB'),
('Wi-9_SB.ifc','Wi9_SB'),
('WW-3_SB.ifc','WW3_SB')]
for f in files:
    gen.execute(('../'+f[0], ), f[1])
print('All files have been generated')