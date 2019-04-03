within ModelicaModels.IFC2X3.UdKB_Test_Cases;
/**************************************************************************************/
// Automatically generated thermal building model by
// CoTeTo code generator IFC_MultiZoneBuildings_Modelica on Wed Apr  3 09:52:37 2019
//
// Used MODELICA_CODE_SWITCHES for code generation:
// surTemOut = on: sets surface temperatures as an output of the building model
// used value: off
//
// intHeaSou = on: sets internal heat sources for all thermal zones:
// used value: on
//
// useAirPaths = on: uses air paths of windows and doors to calculate ventilation rates:
// used value: on
//
// prescribedAirchange = on: defines ventilation rates for each thermal zone as
// a prescribed air change rate:
// used value: off
//
// calcIdealLoads = on: calculates the ideal heating and cooling loads for each
// thermal zone for prescribed set temperatures:
// used value: on
/***************************************************************************************/
model MultiZoneBuilding_BuildingsLib
  "Model of a building with its climate environment"
  extends Modelica.Icons.Example;
  package MediumA = Buildings.Media.Air "Medium model";

  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Insulation100Concrete200 matLayExt
    "Construction material for exterior walls"
    annotation (Placement(transformation(extent={{-60,140},{-40,160}})));

  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Brick120 matLayPar
    "Construction material for partition walls"
    annotation (Placement(transformation(extent={{-20,140},{0,160}})));

  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic matLayRoo(
    material={
      Buildings.HeatTransfer.Data.Solids.InsulationBoard(x=0.2),
      Buildings.HeatTransfer.Data.Solids.Concrete(x=0.2)},
      final nLay=2)
    "Construction material for roof"
    annotation (Placement(transformation(extent={{20,140},{40,160}})));

  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic matLayDoo(
    material={
      Buildings.HeatTransfer.Data.Solids.Plywood(x=0.05)},
      final nLay=1)
    "Construction material for door"
    annotation (Placement(transformation(extent={{-100,140},{-80,160}})));

  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic matLayFlo(
    material={
      Buildings.HeatTransfer.Data.Solids.Concrete(x=0.2),
      Buildings.HeatTransfer.Data.Solids.InsulationBoard(x=0.15),
      Buildings.HeatTransfer.Data.Solids.Concrete(x=0.05)},
      final nLay=3)
    "Construction material for floor"
    annotation (Placement(transformation(extent={{60,140},{80,160}})));

  parameter Buildings.HeatTransfer.Data.GlazingSystems.DoubleClearAir13Clear glaSys(
    UFra=2,
    shade=Buildings.HeatTransfer.Data.Shades.Gray(),
    haveInteriorShade=false,
    haveExteriorShade=false)
    "Data record for the glazing system"
    annotation (Placement(transformation(extent={{100,140},{120,160}})));

  // Thermal zones
  
  Buildings.ThermalZones.Detailed.MixedAir zone_1(
    redeclare package Medium = MediumA,
    AFlo=40267125.00000001,
    hRoo=0.0,
    nConExt=2,
    datConExt(
      layers={
        matLayExt,
        matLayExt},
      A={
        13.095,
        14.91375},
      til={
        1.5707963267948966,
        3.141592653589793},
      azi={
        3.141592653589793,
        0.0}
    ),
    nConExtWin=0,
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        13.095,
        8.3025,
        6.3025},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_2(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        12.0},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        10.8,
        6.100000000000001,
        10.8},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_3(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        12.0},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        10.8,
        10.8,
        6.100000000000001},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_4(
    redeclare package Medium = MediumA,
    AFlo=40267125.00000001,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        14.91375},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=0,
    nConPar=0,
    nConBou=0,
    nSurBou=5,
    surBou(
      A={
        2.0,
        13.095,
        13.095,
        8.3025,
        6.3025},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_5(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        12.0},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        10.8,
        6.100000000000001,
        10.8},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_6(
    redeclare package Medium = MediumA,
    AFlo=51030000.0,
    hRoo=0.0,
    nConExt=2,
    datConExt(
      layers={
        matLayExt,
        matLayExt},
      A={
        8.100000000000001,
        18.9},
      til={
        1.5707963267948966,
        3.141592653589793},
      azi={
        3.141592653589793,
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        17.01},
      glaSys={
        glaSys},
      hWin={
        2.55},
      wWin={
        5.0},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      -1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        8.3025,
        8.3025,
        6.100000000000001},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_7(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        12.0},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        10.8,
        10.8,
        6.100000000000001},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_8(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        12.0},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        10.8,
        10.8,
        6.100000000000001},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_9(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=2,
    datConExt(
      layers={
        matLayExt,
        matLayExt},
      A={
        10.8,
        12.0},
      til={
        1.5707963267948966,
        3.141592653589793},
      azi={
        0.0,
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=3,
    surBou(
      A={
        2.0,
        10.8,
        6.100000000000001},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_10(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        12.0},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=4,
    surBou(
      A={
        2.0,
        10.8,
        6.100000000000001,
        10.8},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_11(
    redeclare package Medium = MediumA,
    AFlo=32400000.000000007,
    hRoo=0.0,
    nConExt=2,
    datConExt(
      layers={
        matLayExt,
        matLayExt},
      A={
        10.8,
        12.0},
      til={
        1.5707963267948966,
        3.141592653589793},
      azi={
        3.141592653589793,
        0.0}
    ),
    nConExtWin=1,
    datConExtWin(
      layers={
        matLayExt},
      A={
        8.100000000000001},
      glaSys={
        glaSys},
      hWin={
        1.55},
      wWin={
        2.5},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1},
      til={
      1.5707963267948966},
      azi={
      1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=3,
    surBou(
      A={
        2.0,
        10.8,
        6.100000000000001},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_12(
    redeclare package Medium = MediumA,
    AFlo=135270000.00000003,
    hRoo=0.0,
    nConExt=5,
    datConExt(
      layers={
        matLayDoo,
        matLayDoo,
        matLayExt,
        matLayExt,
        matLayExt},
      A={
        2.6,
        2.6,
        2.8000000000000003,
        2.8000000000000003,
        50.1},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        3.141592653589793},
      azi={
        0.0,
        3.141592653589793,
        0.0,
        3.141592653589793,
        0.0}
    ),
    nConExtWin=0,
    nConPar=0,
    nConBou=0,
    nSurBou=22,
    surBou(
      A={
        2.0,
        2.0,
        2.0,
        2.0,
        2.0,
        2.0,
        2.0,
        2.0,
        2.0,
        2.0,
        2.0,
        6.3025,
        6.100000000000001,
        6.100000000000001,
        6.3025,
        6.100000000000001,
        6.100000000000001,
        6.100000000000001,
        6.100000000000001,
        6.100000000000001,
        6.100000000000001,
        48.220000000000006},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.ThermalZones.Detailed.MixedAir zone_13(
    redeclare package Medium = MediumA,
    AFlo=401760000.00000006,
    hRoo=0.0,
    nConExt=1,
    datConExt(
      layers={
        matLayExt},
      A={
        148.8},
      til={
        3.141592653589793},
      azi={
        0.0}
    ),
    nConExtWin=2,
    datConExtWin(
      layers={
        matLayExt,
        matLayExt},
      A={
        21.6,
        50.220000000000006},
      glaSys={
        glaSys,
        glaSys},
      hWin={
        1.55,
        2.55},
      wWin={
        5.0,
        16.0},
      ove(wR={0},
      wL={0},
      gap={0.1},
      dep={1}),
      fFra={
      0.1,
      0.1},
      til={
      1.5707963267948966,
      1.5707963267948966},
      azi={
      0.0,
      -1.5707963267948966}
      ),
    nConPar=0,
    nConBou=0,
    nSurBou=5,
    surBou(
      A={
        2.0,
        2.0,
        13.095,
        6.100000000000001,
        48.220000000000006},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));
  
  Buildings.HeatTransfer.Conduction.MultiLayer door_1(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_2(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_3(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_4(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_5(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_6(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_7(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_8(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_9(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_10(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_11(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer door_13(
    A=2.0,
    layers=matLayDoo,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));

  Buildings.HeatTransfer.Conduction.MultiLayer wall_1(
    A=13.095,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_2(
    A=8.3025,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_4(
    A=6.3025,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_5(
    A=10.8,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_6(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_7(
    A=10.8,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_9(
    A=10.8,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_10(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_12(
    A=13.095,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_13(
    A=8.3025,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_14(
    A=6.3025,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_15(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_16(
    A=10.8,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_20(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_21(
    A=10.8,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_22(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_24(
    A=10.8,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_25(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_28(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_30(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_31(
    A=10.8,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_35(
    A=6.100000000000001,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_37(
    A=48.220000000000006,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));

  Modelica.Blocks.Sources.Constant qConGai_flow(k=0) "Convective heat gain"
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));

  Modelica.Blocks.Sources.Constant qRadGai_flow(k=0) "Radiative heat gain"
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));

  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));

  Modelica.Blocks.Sources.Constant qLatGai_flow(k=0) "Latent heat gain"
    annotation (Placement(transformation(extent={{-62,2},{-42,22}})));

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    filNam=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"),
    computeWetBulbTemperature=false)
    annotation (Placement(transformation(extent={{160,140},{180,160}})));

  Modelica.Blocks.Sources.Constant uSha(k=0)
    "Control signal for the shading device"
    annotation (Placement(transformation(extent={{-20,90},{0,110}})));

  Modelica.Blocks.Routing.Replicator replicator(nout=max(1,2))
    annotation (Placement(transformation(extent={{10,90},{30,110}})));

equation
  connect(qRadGai_flow.y, multiplex3_1.u1[1])
    annotation (Line(points={{-39,90},{-32,90},{-32,57},{-22,57}},color={0,0,127},smooth=Smooth.None));

  connect(qConGai_flow.y, multiplex3_1.u2[1])
    annotation (Line(points={{-39,50},{-22,50}},color={0,0,127},smooth=Smooth.None));

  connect(qLatGai_flow.y, multiplex3_1.u3[1])
    annotation (Line(points={{-41,12},{-32,12},{-32,43},{-22,43}},color={0,0,127},smooth=Smooth.None));

  // connections between construction elements and thermal zones
  connect(door_1.port_a, zone_1.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_1.port_a, zone_1.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_2.port_a, zone_1.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_4.port_a, zone_1.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_2.port_a, zone_2.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_5.port_a, zone_2.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_6.port_a, zone_2.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_7.port_a, zone_2.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_3.port_a, zone_3.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_5.port_b, zone_3.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_9.port_a, zone_3.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_10.port_a, zone_3.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_4.port_a, zone_4.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_1.port_b, zone_4.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_12.port_a, zone_4.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_13.port_a, zone_4.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_14.port_a, zone_4.surf_surBou[5])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_5.port_a, zone_5.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_7.port_b, zone_5.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_15.port_a, zone_5.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_16.port_a, zone_5.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_6.port_a, zone_6.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_2.port_b, zone_6.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_13.port_b, zone_6.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_20.port_a, zone_6.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_7.port_a, zone_7.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_9.port_b, zone_7.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_21.port_a, zone_7.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_22.port_a, zone_7.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_8.port_a, zone_8.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_21.port_b, zone_8.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_24.port_a, zone_8.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_25.port_a, zone_8.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_9.port_a, zone_9.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_24.port_b, zone_9.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_28.port_a, zone_9.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_10.port_a, zone_10.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_16.port_b, zone_10.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_30.port_a, zone_10.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_31.port_a, zone_10.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_11.port_a, zone_11.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_31.port_b, zone_11.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_35.port_a, zone_11.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_1.port_b, zone_12.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_2.port_b, zone_12.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_3.port_b, zone_12.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_4.port_b, zone_12.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_5.port_b, zone_12.surf_surBou[5])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_7.port_b, zone_12.surf_surBou[6])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_8.port_b, zone_12.surf_surBou[7])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_9.port_b, zone_12.surf_surBou[8])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_10.port_b, zone_12.surf_surBou[9])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_11.port_b, zone_12.surf_surBou[10])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_13.port_a, zone_12.surf_surBou[11])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_4.port_b, zone_12.surf_surBou[12])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_6.port_b, zone_12.surf_surBou[13])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_10.port_b, zone_12.surf_surBou[14])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_14.port_b, zone_12.surf_surBou[15])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_15.port_b, zone_12.surf_surBou[16])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_22.port_b, zone_12.surf_surBou[17])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_25.port_b, zone_12.surf_surBou[18])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_28.port_b, zone_12.surf_surBou[19])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_30.port_b, zone_12.surf_surBou[20])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_35.port_b, zone_12.surf_surBou[21])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_37.port_a, zone_12.surf_surBou[22])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_6.port_b, zone_13.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(door_13.port_b, zone_13.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_12.port_b, zone_13.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_20.port_b, zone_13.surf_surBou[4])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_37.port_b, zone_13.surf_surBou[5])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));

  connect(multiplex3_1.y, zone_1.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_1.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_1.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_2.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_2.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_2.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_3.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_3.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_3.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_4.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_4.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_4.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_5.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_5.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_5.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_6.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_6.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_6.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_7.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_7.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_7.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_8.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_8.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_8.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_9.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_9.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_9.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_10.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_10.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_10.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_11.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_11.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_11.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_12.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_12.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_12.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));
  connect(multiplex3_1.y, zone_13.qGai_flow)
    annotation (Line(points={{1,50},{22,50},{22,48},{44.4,48}},color={0,0,127},smooth=Smooth.None));

  connect(weaDat.weaBus, zone_13.weaBus)
    annotation (Line(points={{180,150},{190,150},{190,57.9},{83.9,57.9}},color={255,204,51},thickness=0.5,smooth=Smooth.None));

  connect(zone_13.uSha, replicator.y)
    annotation (Line(points={{44.4,58},{40,58},{40,100},{31,100}},color={0,0,127},smooth=Smooth.None));

  connect(uSha.y, replicator.u)
    annotation (Line(points={{1,100},{8,100}},color={0,0,127},smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,200}})));
  end MultiZoneBuilding_BuildingsLib;
