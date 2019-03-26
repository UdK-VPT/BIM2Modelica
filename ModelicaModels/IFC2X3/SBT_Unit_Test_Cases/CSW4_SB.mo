within ModelicaModels.IFC2X3.SBT_Unit_Test_Cases;
/**************************************************************************************/
// Automatically generated thermal building model by
// CoTeTo code generator IFC_MultiZoneBuildings_Modelica on Tue Mar 26 12:33:19 2019
//
// Used MODELICA_CODE_SWITCHES for code generation:
// surTemOut = on: sets surface temperatures as an output of the building model
// used value: off
//
// intHeaSou = on: sets internal heat sources for all thermal zones:
// used value: on
//
// useAirPaths = on: uses air paths of windows and doors to calculate ventilation rates:
// used value: off
//
// prescribedAirchange = on: defines ventilation rates for each thermal zone as
// a prescribed air change rate:
// used value: on
//
// calcIdealLoads = on: calculates the ideal heating and cooling loads for each
// thermal zone for prescribed set temperatures:
// used value: on
/***************************************************************************************/
model CSW4_SB
  "Model of a building with its climate environment"
  extends Modelica.Icons.Example;

  record Construction1
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.2
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction1;

  model Building
    "Automatically generated multi-zone building model"
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 4,
    surfacesToAmbient(nSurfaces = 16),
    nSurfacesSolid = 0,
    surfacesToSolids(nSurfaces = nSurfacesSolid),
    useAirPaths = false,
    calcIdealLoads = true,
    prescribedAirchange = true,
    heatSources = true,
    nHeatSources = 4,
    convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced);

    // Thermal zones
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_1(
      V=72.20039276799999,
      nConstructions = 6,
      calcIdealLoads = true,
      prescribedAirchange = true,
      heatSources = true,
      nHeatSources = 1,
      height=3.0);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_2(
      V=597.96758656,
      nConstructions = 10,
      calcIdealLoads = true,
      prescribedAirchange = true,
      heatSources = true,
      nHeatSources = 1,
      height=3.0);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_3(
      V=75.99999999999999,
      nConstructions = 6,
      calcIdealLoads = true,
      prescribedAirchange = true,
      heatSources = true,
      nHeatSources = 1,
      height=3.0);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_4(
      V=759.9999999999999,
      nConstructions = 8,
      calcIdealLoads = true,
      prescribedAirchange = true,
      heatSources = true,
      nHeatSources = 1,
      height=3.0);

    // Opaque construction elements
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_1(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.0000272);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_2(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 3.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_3(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.0000272);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_4(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 3.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_1(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.0000272);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_2(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.0000272);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_5(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 14.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_6(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_7(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_8(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_9(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 14.799972799999999);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_10(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 6.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_3(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = -68.56,
      height = 6.0,
      width = 14.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_4(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = -68.56,
      height = 6.0,
      width = 14.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_11(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_12(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_5(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 4.0,
      width = 5.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_6(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.0,
      height = 4.0,
      width = 5.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_13(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 20.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_14(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 10.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_15(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 20.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_16(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 10.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_7(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.0,
      height = 10.0,
      width = 20.0);

    // Transparent construction elements

    // Door elements

  equation

    // connections between construction elements and thermal zones
    connect(wall_1.toSurfacePort_1, zone_1.toConstructionPorts[1]);
    connect(wall_2.toSurfacePort_1, zone_1.toConstructionPorts[2]);
    connect(wall_3.toSurfacePort_1, zone_1.toConstructionPorts[3]);
    connect(wall_4.toSurfacePort_1, zone_1.toConstructionPorts[4]);
    connect(slab_1.toSurfacePort_1, zone_1.toConstructionPorts[5]);
    connect(slab_2.toSurfacePort_1, zone_1.toConstructionPorts[6]);
    connect(wall_3.toSurfacePort_2, zone_2.toConstructionPorts[1]);
    connect(wall_4.toSurfacePort_2, zone_2.toConstructionPorts[2]);
    connect(wall_5.toSurfacePort_1, zone_2.toConstructionPorts[3]);
    connect(wall_6.toSurfacePort_1, zone_2.toConstructionPorts[4]);
    connect(wall_7.toSurfacePort_1, zone_2.toConstructionPorts[5]);
    connect(wall_8.toSurfacePort_1, zone_2.toConstructionPorts[6]);
    connect(wall_9.toSurfacePort_1, zone_2.toConstructionPorts[7]);
    connect(wall_10.toSurfacePort_1, zone_2.toConstructionPorts[8]);
    connect(slab_3.toSurfacePort_1, zone_2.toConstructionPorts[9]);
    connect(slab_4.toSurfacePort_1, zone_2.toConstructionPorts[10]);
    connect(slab_2.toSurfacePort_2, zone_4.toConstructionPorts[1]);
    connect(slab_4.toSurfacePort_2, zone_4.toConstructionPorts[2]);
    connect(slab_6.toSurfacePort_2, zone_4.toConstructionPorts[3]);
    connect(wall_13.toSurfacePort_1, zone_4.toConstructionPorts[4]);
    connect(wall_14.toSurfacePort_1, zone_4.toConstructionPorts[5]);
    connect(wall_15.toSurfacePort_1, zone_4.toConstructionPorts[6]);
    connect(wall_16.toSurfacePort_1, zone_4.toConstructionPorts[7]);
    connect(slab_7.toSurfacePort_1, zone_4.toConstructionPorts[8]);
    connect(wall_6.toSurfacePort_2, zone_3.toConstructionPorts[1]);
    connect(wall_7.toSurfacePort_2, zone_3.toConstructionPorts[2]);
    connect(wall_11.toSurfacePort_1, zone_3.toConstructionPorts[3]);
    connect(wall_12.toSurfacePort_1, zone_3.toConstructionPorts[4]);
    connect(slab_5.toSurfacePort_1, zone_3.toConstructionPorts[5]);
    connect(slab_6.toSurfacePort_1, zone_3.toConstructionPorts[6]);

    // connections between construction elements and environment
    connect(wall_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1]);
    connect(wall_2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2]);
    connect(slab_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3]);
    connect(wall_5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4]);
    connect(wall_8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5]);
    connect(wall_9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6]);
    connect(wall_10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7]);
    connect(slab_3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8]);
    connect(wall_11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9]);
    connect(wall_12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10]);
    connect(slab_5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11]);
    connect(wall_13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12]);
    connect(wall_14.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[13]);
    connect(wall_15.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[14]);
    connect(wall_16.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[15]);
    connect(slab_7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[16]);

    // Heating set temperature of each thermal zones
    connect(zone_1.T_setHeating, T_setHeating[1]);
    connect(zone_2.T_setHeating, T_setHeating[2]);
    connect(zone_3.T_setHeating, T_setHeating[3]);
    connect(zone_4.T_setHeating, T_setHeating[4]);

    // Cooling set temperatures of each thermal zones
    connect(zone_1.T_setCooling, T_setCooling[1]);
    connect(zone_2.T_setCooling, T_setCooling[2]);
    connect(zone_3.T_setCooling, T_setCooling[3]);
    connect(zone_4.T_setCooling, T_setCooling[4]);

    // Cooling load of each thermal zones
    connect(zone_1.Q_flow_cooling, Q_flow_cooling[1]);
    connect(zone_2.Q_flow_cooling, Q_flow_cooling[2]);
    connect(zone_3.Q_flow_cooling, Q_flow_cooling[3]);
    connect(zone_4.Q_flow_cooling, Q_flow_cooling[4]);

    // Heating load of each thermal zones
    connect(zone_1.Q_flow_heating, Q_flow_heating[1]);
    connect(zone_2.Q_flow_heating, Q_flow_heating[2]);
    connect(zone_3.Q_flow_heating, Q_flow_heating[3]);
    connect(zone_4.Q_flow_heating, Q_flow_heating[4]);

    // airchange rates of each thermal zones
    connect(zone_1.airchange, airchange[1]);
    connect(zone_2.airchange, airchange[2]);
    connect(zone_3.airchange, airchange[3]);
    connect(zone_4.airchange, airchange[4]);

    // ambient temperature of each thermal zones
    connect(zone_1.TAirAmb, TAirAmb);
    connect(zone_2.TAirAmb, TAirAmb);
    connect(zone_3.TAirAmb, TAirAmb);
    connect(zone_4.TAirAmb, TAirAmb);

    // ambient moisture of each thermal zones
    connect(zone_1.xAirAmb, xAirAmb);
    connect(zone_2.xAirAmb, xAirAmb);
    connect(zone_3.xAirAmb, xAirAmb);
    connect(zone_4.xAirAmb, xAirAmb);
    // Radiative heating source of each thermal zones
    connect(zone_1.radHeatSourcesPorts[1], radHeatSourcesPorts[1]);
    connect(zone_2.radHeatSourcesPorts[1], radHeatSourcesPorts[2]);
    connect(zone_3.radHeatSourcesPorts[1], radHeatSourcesPorts[3]);
    connect(zone_4.radHeatSourcesPorts[1], radHeatSourcesPorts[4]);

    // Convective heating source of each thermal zones
    connect(zone_1.conHeatSourcesPorts[1], conHeatSourcesPorts[1]);
    connect(zone_2.conHeatSourcesPorts[1], conHeatSourcesPorts[2]);
    connect(zone_3.conHeatSourcesPorts[1], conHeatSourcesPorts[3]);
    connect(zone_4.conHeatSourcesPorts[1], conHeatSourcesPorts[4]);
  end Building;

  Building building(
    nZones = 4)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));

  BuildingSystems.Buildings.Ambient environment(
    nSurfaces = building.nSurfacesAmbient,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));

    // Heating set temperature of the thermal zones
    Modelica.Blocks.Sources.Constant TSetHeating_zone_1(
      k=273.15 + 20.0)
      annotation (Placement(transformation(extent={{58,16},{50,24}})));
    Modelica.Blocks.Sources.Constant TSetHeating_zone_2(
      k=273.15 + 20.0)
      annotation (Placement(transformation(extent={{58,16},{50,24}})));
    Modelica.Blocks.Sources.Constant TSetHeating_zone_3(
      k=273.15 + 20.0)
      annotation (Placement(transformation(extent={{58,16},{50,24}})));
    Modelica.Blocks.Sources.Constant TSetHeating_zone_4(
      k=273.15 + 20.0)
      annotation (Placement(transformation(extent={{58,16},{50,24}})));

    // Cooling set temperature of each thermal zones
    Modelica.Blocks.Sources.Constant TSetCooling_zone_1(
      k=273.15 + 24.0)
      annotation (Placement(transformation(extent={{58,2},{50,10}})));
    Modelica.Blocks.Sources.Constant TSetCooling_zone_2(
      k=273.15 + 24.0)
      annotation (Placement(transformation(extent={{58,2},{50,10}})));
    Modelica.Blocks.Sources.Constant TSetCooling_zone_3(
      k=273.15 + 24.0)
      annotation (Placement(transformation(extent={{58,2},{50,10}})));
    Modelica.Blocks.Sources.Constant TSetCooling_zone_4(
      k=273.15 + 24.0)
      annotation (Placement(transformation(extent={{58,2},{50,10}})));
    // Air change rate of each thermal zones
    Modelica.Blocks.Sources.Constant airchange_zone_1(
      k=0.5)
    annotation (Placement(transformation(extent={{58,-14},{50,-6}})));
    Modelica.Blocks.Sources.Constant airchange_zone_2(
      k=0.5)
    annotation (Placement(transformation(extent={{58,-14},{50,-6}})));
    Modelica.Blocks.Sources.Constant airchange_zone_3(
      k=0.5)
    annotation (Placement(transformation(extent={{58,-14},{50,-6}})));
    Modelica.Blocks.Sources.Constant airchange_zone_4(
      k=0.5)
    annotation (Placement(transformation(extent={{58,-14},{50,-6}})));

    // Heating source of each thermal zones
    Modelica.Blocks.Sources.Constant heatsources_zone_1(
      k=0.0)
      annotation (Placement(transformation(extent={{44,22},{36,30}})));
    Modelica.Blocks.Sources.Constant heatsources_zone_2(
      k=0.0)
      annotation (Placement(transformation(extent={{44,22},{36,30}})));
    Modelica.Blocks.Sources.Constant heatsources_zone_3(
      k=0.0)
      annotation (Placement(transformation(extent={{44,22},{36,30}})));
    Modelica.Blocks.Sources.Constant heatsources_zone_4(
      k=0.0)
      annotation (Placement(transformation(extent={{44,22},{36,30}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatFlow[4]
      annotation (Placement(transformation(extent={{32,22},{24,30}})));
    BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relationRadiationConvection[4](
      each radiationportion = 0.5)
      annotation (Placement(transformation(extent={{-5,-5},{5,5}},rotation=-90,origin={21,21})));
  equation
    // building constructions to the environment
    connect(environment.toSurfacePorts, building.toAmbientSurfacesPorts)
      annotation (Line(points={{-12,4},{11,4}},color={0,255,0},smooth=Smooth.None));
    connect(environment.toAirPorts, building.toAmbientAirPorts)
      annotation (Line(points={{-12,-4},{11,-4}},color={85,170,255},smooth=Smooth.None));
    connect(environment.TAirRef, building.TAirAmb)
      annotation (Line(points={{-28.2,7},{-30,7},{-30,12},{-30,14},{26.2,14},{26.2,9.8}}, color={0,0,127}));
    connect(environment.xAir, building.xAirAmb)
      annotation (Line(points={{-28.2,5},{-32,5},{-32,16},{28.4,16},{28.4,9.8}}, color={0,0,127}));

    // Air change rate of each thermal zones
    connect(airchange_zone_1.y, building.airchange[1])
      annotation (Line(points={{29.8,3.5},{44,3.5},{44,-10},{49.6,-10}}, color={0,0,127}));
    connect(airchange_zone_2.y, building.airchange[2])
      annotation (Line(points={{29.8,3.5},{44,3.5},{44,-10},{49.6,-10}}, color={0,0,127}));
    connect(airchange_zone_3.y, building.airchange[3])
      annotation (Line(points={{29.8,3.5},{44,3.5},{44,-10},{49.6,-10}}, color={0,0,127}));
    connect(airchange_zone_4.y, building.airchange[4])
      annotation (Line(points={{29.8,3.5},{44,3.5},{44,-10},{49.6,-10}}, color={0,0,127}));

    // Heating set temperature of each thermal zones
    connect(TSetHeating_zone_1.y, building.T_setHeating[1])
      annotation (Line(points={{29.8,7.5},{44,7.5},{44,20},{49.6,20}}, color={0,0,127}));
    connect(TSetHeating_zone_2.y, building.T_setHeating[2])
      annotation (Line(points={{29.8,7.5},{44,7.5},{44,20},{49.6,20}}, color={0,0,127}));
    connect(TSetHeating_zone_3.y, building.T_setHeating[3])
      annotation (Line(points={{29.8,7.5},{44,7.5},{44,20},{49.6,20}}, color={0,0,127}));
    connect(TSetHeating_zone_4.y, building.T_setHeating[4])
      annotation (Line(points={{29.8,7.5},{44,7.5},{44,20},{49.6,20}}, color={0,0,127}));

    // Cooling set temperature of each thermal zones
    connect(TSetCooling_zone_1.y, building.T_setCooling[1])
      annotation (Line(points={{29.8,5.5},{39.6,5.5},{39.6,6},{49.6,6}}, color={0,0,127}));
    connect(TSetCooling_zone_2.y, building.T_setCooling[2])
      annotation (Line(points={{29.8,5.5},{39.6,5.5},{39.6,6},{49.6,6}}, color={0,0,127}));
    connect(TSetCooling_zone_3.y, building.T_setCooling[3])
      annotation (Line(points={{29.8,5.5},{39.6,5.5},{39.6,6},{49.6,6}}, color={0,0,127}));
    connect(TSetCooling_zone_4.y, building.T_setCooling[4])
      annotation (Line(points={{29.8,5.5},{39.6,5.5},{39.6,6},{49.6,6}}, color={0,0,127}));

    // Heating source of each thermal zones
    connect(heatsources_zone_1.y, heatFlow[1].Q_flow)
      annotation (Line(points={{32,26},{35.6,26}}, color={0,0,127}));
    connect(heatsources_zone_2.y, heatFlow[2].Q_flow)
      annotation (Line(points={{32,26},{35.6,26}}, color={0,0,127}));
    connect(heatsources_zone_3.y, heatFlow[3].Q_flow)
      annotation (Line(points={{32,26},{35.6,26}}, color={0,0,127}));
    connect(heatsources_zone_4.y, heatFlow[4].Q_flow)
      annotation (Line(points={{32,26},{35.6,26}}, color={0,0,127}));
    connect(relationRadiationConvection.heatPort, heatFlow.port)
      annotation (Line(points={{21,22.5},{21,26},{24,26}}, color={191,0,0}));
    connect(relationRadiationConvection.heatPortCv, building.conHeatSourcesPorts[1:4])
      annotation (Line(points={{22,19},{22,10.5}}, color={191,0,0}));
    connect(relationRadiationConvection.heatPortLw, building.radHeatSourcesPorts[1:4])
      annotation (Line(points={{20,19},{20,10.5}}, color={191,0,0}));

  annotation(experiment(StartTime=0, StopTime=31536000, __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://ModelicaModels/Resources/Scripts/Dymola/IFC2X3/SBT_Unit_Test_Cases/CSW4_SB.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
  end CSW4_SB;
