# paths and info
import os, sys
homeDir = os.environ['HOMEPATH']
jmodDir = os.environ['JMODELICA_HOME']
workDir = "Desktop" # has to be adapted by the user !!!
moLiDir = os.path.join(homeDir, workDir, "BIM2Modelica")

# give the path to directory where package.mo is stored
moLibs = [os.path.join(jmodDir, "ThirdParty\MSL\Modelica"),
		  os.path.join(moLiDir,"BuildingSystems\BuildingSystems"),
		  os.path.join(moLiDir,"ModelicaModels"),
         ]

print(sys.version)
print(all(os.path.isfile(os.path.join(moLib, "package.mo")) for moLib in moLibs))
print(os.getcwd())

# compile model to fmu
from pymodelica import compile_fmu
model_name = 'ModelicaModels.IFC2X3.UdKB_Unit_Test_Cases.OneZone'
my_fmu = compile_fmu(model_name, moLibs)

# simulate the fmu and store results
from pyfmi import load_fmu

myModel = load_fmu(my_fmu)

opts = myModel.simulate_options()
opts['solver'] = "CVode"
opts['ncp'] = 8760
opts['result_handling']="file"
opts["CVode_options"]['discr'] = 'BDF'
opts['CVode_options']['iter'] = 'Newton'
opts['CVode_options']['maxord'] = 5
opts['CVode_options']['atol'] = 1e-5
opts['CVode_options']['rtol'] = 1e-5

res = myModel.simulate(start_time=0.0, final_time=31536000.0, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# building
# temperatures
y1 = res['ambience.TAirRef']
y2 = res['building.zone_1.TAir']
y3 = res['building.zone_1.TOperative']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3)
P.legend(['ambience.TAirRef','building.zone_1.TAir','building.zone_1.TOperative'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# Heating load
y1 = res['building.zone_1.Q_flow_heating']
P.subplot(2,1,2)
P.plot(t, y1)
P.legend(['building.zone_1.Q_flow_heating'])
P.ylabel('power (W)')
P.xlabel('Time (s)')
P.show()
