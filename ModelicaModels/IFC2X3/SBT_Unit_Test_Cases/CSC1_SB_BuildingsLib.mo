within ModelicaModels.IFC2X3.SBT_Unit_Test_Cases;
/**************************************************************************************/
// Automatically generated thermal building model by
// CoTeTo code generator IFC_MultiZoneBuildings_Modelica on Mon Apr  1 01:37:48 2019
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
model CSC1_SB_BuildingsLib
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
    AFlo=99.0,
    hRoo=3.8000000000000003,
    nConExt=4,
    datConExt(
      layers={
        matLayExt,
        matLayExt,
        matLayExt,
        matLayExt},
      A={
        37.62,
        37.62,
        38.0,
        99.0},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        3.141592653589793},
      azi={
        0.0,
        3.141592653589793,
        1.5707963267948966,
        0.0}
    ),
    nConExtWin=0,
    nConPar=0,
    nConBou=0,
    nSurBou=3,
    surBou(
      A={
        17.86,
        17.86,
        99.0},
      til={
        1.5707963267948966,
        1.5707963267948966,
        0.0},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));

  Buildings.ThermalZones.Detailed.MixedAir zone_2(
    redeclare package Medium = MediumA,
    AFlo=98.75999999999998,
    hRoo=3.8000000000000003,
    nConExt=4,
    datConExt(
      layers={
        matLayExt,
        matLayExt,
        matLayExt,
        matLayExt},
      A={
        38.0,
        37.62,
        37.62,
        98.76},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        3.141592653589793},
      azi={
        -1.5707963267948966,
        3.141592653589793,
        0.0,
        0.0}
    ),
    nConExtWin=0,
    nConPar=0,
    nConBou=0,
    nSurBou=3,
    surBou(
      A={
        17.86,
        17.86,
        98.76},
      til={
        1.5707963267948966,
        1.5707963267948966,
        0.0},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));

  Buildings.ThermalZones.Detailed.MixedAir zone_3(
    redeclare package Medium = MediumA,
    AFlo=97.4358974358974,
    hRoo=7.8,
    nConExt=5,
    datConExt(
      layers={
        matLayExt,
        matLayExt,
        matLayExt,
        matLayExt,
        matLayExt},
      A={
        38.0,
        76.0,
        38.0,
        76.0,
        200.0},
      til={
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        1.5707963267948966,
        0.0},
      azi={
        -1.5707963267948966,
        3.141592653589793,
        1.5707963267948966,
        0.0,
        0.0}
    ),
    nConExtWin=0,
    nConPar=0,
    nConBou=0,
    nSurBou=2,
    surBou(
      A={
        99.0,
        98.76},
      til={
        0.0,
        0.0},
      each absIR=0.9,
      each absSol=0.9),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=273.15+22,
    lat=0.73268921998722)
    "Room model"
    annotation (Placement(transformation(extent={{46,20},{86,60}})));


  Buildings.HeatTransfer.Conduction.MultiLayer wall_2(
    A=17.86,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer wall_3(
    A=17.86,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer slab_2(
    A=99.0,
    layers=matLayPar,
    stateAtSurface_b=false)
    "Construction that is modeled outside of room"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.HeatTransfer.Conduction.MultiLayer slab_4(
    A=98.76,
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

  Modelica.Blocks.Routing.Replicator replicator(nout=max(1,0))
    annotation (Placement(transformation(extent={{10,90},{30,110}})));

equation
  connect(qRadGai_flow.y, multiplex3_1.u1[1])
    annotation (Line(points={{-39,90},{-32,90},{-32,57},{-22,57}},color={0,0,127},smooth=Smooth.None));

  connect(qConGai_flow.y, multiplex3_1.u2[1])
    annotation (Line(points={{-39,50},{-22,50}},color={0,0,127},smooth=Smooth.None));

  connect(qLatGai_flow.y, multiplex3_1.u3[1])
    annotation (Line(points={{-41,12},{-32,12},{-32,43},{-22,43}},color={0,0,127},smooth=Smooth.None));

  // connections between construction elements and thermal zones
  connect(wall_2.port_a, zone_1.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_3.port_a, zone_1.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(slab_2.port_a, zone_1.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_2.port_b, zone_2.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(wall_3.port_b, zone_2.surf_surBou[2])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(slab_4.port_a, zone_2.surf_surBou[3])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(slab_2.port_b, zone_3.surf_surBou[1])
    annotation (Line(points={{62.2,26},{62,26},{62,-10},{80,-10}}, color={191,0,0}));
  connect(slab_4.port_b, zone_3.surf_surBou[2])
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

  connect(uSha.y, replicator.u)
    annotation (Line(points={{1,100},{8,100}},color={0,0,127},smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,200}})));
  end CSC1_SB_BuildingsLib;
