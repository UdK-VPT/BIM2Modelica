within ModelicaModels.IFC2X3.SBT_Unit_Test_Cases;
model SWW4_SB
  "Model of a building with its climate ambient"
  extends Modelica.Icons.Example;

  record Construction1
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        200.0
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction1;

  model Building
    "Automatically generated multi-zone building model"
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 6,
    surfacesToAmbient(nSurfaces = 22),
    nSurfacesSolid = 0,
    surfacesToSolids(nSurfaces = nSurfacesSolid),
    convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    useAirPaths = false,
    heatSources = true,
    nHeatSources = 6);

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_1(
      V=349.1858719403758,
      height=3.0,
      nConstructions=11,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_2(
      V=393.1704481715612,
      height=3.0,
      nConstructions=12,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_3(
      V=132.23999999999998,
      height=3.0,
      nConstructions=7,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_4(
      V=215.992,
      height=3.0,
      nConstructions=7,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_5(
      V=144.39999999999998,
      height=3.0,
      nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_6(
      V=243.2,
      height=3.0,
      nConstructions=8,
      heatSources=true,
      nHeatSources=1);

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_1(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 19.660647);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_2(
      redeclare Construction1 constructionData,
      angleDegAzi = 36.11133551452778,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 7.661010822339307);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_3(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 7.1629249999999995);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_4(
      redeclare Construction1 constructionData,
      angleDegAzi = 41.34664424754513,
      angleDegTil = 90.0,
      AInnSur = -0.0,
      height = 3.8,
      width = 8.302811579904988);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_5(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 10.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_1(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 104.715,
      height = 10.0,
      width = 19.660647);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_2(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = -11.688,
      height = 0,
      width = 7.006849756395011);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_3(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 10.701,
      height = 5.8,
      width = 9.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_4(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 6.353,
      height = 3.8,
      width = 10.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_5(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = -0.131,
      height = 0,
      width = 0.7268102073376216);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_6(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 19.697251);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_7(
      redeclare Construction1 constructionData,
      angleDegAzi = -138.6533557524549,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 8.000062676004482);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_8(
      redeclare Construction1 constructionData,
      angleDegAzi = -143.88866448547222,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 8.000400921203887);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_9(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 10.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_6(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 93.507,
      height = 10.0,
      width = 19.697251);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_7(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = -21.669,
      height = 0,
      width = 7.426907161150133);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_8(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 2.319,
      height = 1.2770030914706147,
      width = 8.724333087144242);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_9(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = -5.381,
      height = 0,
      width = 4.6584881691879865);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_10(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.317,
      height = 4.0,
      width = 16.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_10(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_11(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 6.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_12(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_13(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 6.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_11(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.0,
      height = 5.8,
      width = 6.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_14(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 9.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_15(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 5.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_16(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 9.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_12(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.0,
      height = 5.8,
      width = 9.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_17(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 10.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_18(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 3.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_19(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_20(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 3.8);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_13(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 10.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_21(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_22(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 3.8,
      width = 16.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_14(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      AInnSur = 0.0,
      height = 4.0,
      width = 16.0);

  equation
    // connections between construction elements and zones
    connect(wall_1.toSurfacePort_1, zone_1.toConstructionPorts[1]);
    connect(wall_2.toSurfacePort_1, zone_1.toConstructionPorts[2]);
    connect(wall_3.toSurfacePort_1, zone_1.toConstructionPorts[3]);
    connect(wall_4.toSurfacePort_1, zone_1.toConstructionPorts[4]);
    connect(wall_5.toSurfacePort_1, zone_1.toConstructionPorts[5]);
    connect(slab_1.toSurfacePort_1, zone_1.toConstructionPorts[6]);
    connect(slab_2.toSurfacePort_1, zone_1.toConstructionPorts[7]);
    connect(slab_3.toSurfacePort_1, zone_1.toConstructionPorts[8]);
    connect(slab_4.toSurfacePort_1, zone_1.toConstructionPorts[9]);
    connect(slab_5.toSurfacePort_1, zone_1.toConstructionPorts[10]);
    connect(wall_3.toSurfacePort_2, zone_2.toConstructionPorts[1]);
    connect(wall_6.toSurfacePort_1, zone_2.toConstructionPorts[2]);
    connect(wall_7.toSurfacePort_1, zone_2.toConstructionPorts[3]);
    connect(wall_8.toSurfacePort_1, zone_2.toConstructionPorts[4]);
    connect(wall_9.toSurfacePort_1, zone_2.toConstructionPorts[5]);
    connect(slab_6.toSurfacePort_1, zone_2.toConstructionPorts[6]);
    connect(slab_7.toSurfacePort_1, zone_2.toConstructionPorts[7]);
    connect(slab_8.toSurfacePort_1, zone_2.toConstructionPorts[8]);
    connect(slab_9.toSurfacePort_1, zone_2.toConstructionPorts[9]);
    connect(slab_10.toSurfacePort_1, zone_2.toConstructionPorts[10]);
    connect(slab_2.toSurfacePort_2, zone_3.toConstructionPorts[1]);
    connect(slab_7.toSurfacePort_2, zone_3.toConstructionPorts[2]);
    connect(wall_10.toSurfacePort_1, zone_3.toConstructionPorts[3]);
    connect(wall_11.toSurfacePort_1, zone_3.toConstructionPorts[4]);
    connect(wall_12.toSurfacePort_1, zone_3.toConstructionPorts[5]);
    connect(wall_13.toSurfacePort_1, zone_3.toConstructionPorts[6]);
    connect(slab_11.toSurfacePort_1, zone_3.toConstructionPorts[7]);
    connect(slab_3.toSurfacePort_2, zone_4.toConstructionPorts[1]);
    connect(slab_8.toSurfacePort_2, zone_4.toConstructionPorts[2]);
    connect(wall_12.toSurfacePort_2, zone_4.toConstructionPorts[3]);
    connect(wall_14.toSurfacePort_1, zone_4.toConstructionPorts[4]);
    connect(wall_15.toSurfacePort_1, zone_4.toConstructionPorts[5]);
    connect(wall_16.toSurfacePort_1, zone_4.toConstructionPorts[6]);
    connect(slab_12.toSurfacePort_1, zone_4.toConstructionPorts[7]);
    connect(slab_4.toSurfacePort_2, zone_5.toConstructionPorts[1]);
    connect(slab_9.toSurfacePort_2, zone_5.toConstructionPorts[2]);
    connect(wall_15.toSurfacePort_2, zone_5.toConstructionPorts[3]);
    connect(wall_17.toSurfacePort_1, zone_5.toConstructionPorts[4]);
    connect(wall_18.toSurfacePort_1, zone_5.toConstructionPorts[5]);
    connect(wall_19.toSurfacePort_1, zone_5.toConstructionPorts[6]);
    connect(wall_20.toSurfacePort_1, zone_5.toConstructionPorts[7]);
    connect(slab_13.toSurfacePort_1, zone_5.toConstructionPorts[8]);
    connect(slab_5.toSurfacePort_2, zone_6.toConstructionPorts[1]);
    connect(slab_10.toSurfacePort_2, zone_6.toConstructionPorts[2]);
    connect(wall_11.toSurfacePort_2, zone_6.toConstructionPorts[3]);
    connect(wall_14.toSurfacePort_2, zone_6.toConstructionPorts[4]);
    connect(wall_19.toSurfacePort_2, zone_6.toConstructionPorts[5]);
    connect(wall_21.toSurfacePort_1, zone_6.toConstructionPorts[6]);
    connect(wall_22.toSurfacePort_1, zone_6.toConstructionPorts[7]);
    connect(slab_14.toSurfacePort_1, zone_6.toConstructionPorts[8]);
    // connections between construction elements and ambient
    connect(wall_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1]);
    connect(wall_2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2]);
    connect(wall_4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3]);
    connect(wall_5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4]);
    connect(slab_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5]);
    connect(wall_6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6]);
    connect(wall_7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7]);
    connect(wall_8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8]);
    connect(wall_9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9]);
    connect(slab_6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10]);
    connect(wall_10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11]);
    connect(wall_13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12]);
    connect(slab_11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[13]);
    connect(wall_16.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[14]);
    connect(slab_12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[15]);
    connect(wall_17.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[16]);
    connect(wall_18.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[17]);
    connect(wall_20.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[18]);
    connect(slab_13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[19]);
    connect(wall_21.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[20]);
    connect(wall_22.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[21]);
    connect(slab_14.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[22]);
    // connections between construction elements and ground
  // Heating set temperature of each thermal zones
    connect(zone_1.T_setHeating, T_setHeating[1]);
    connect(zone_2.T_setHeating, T_setHeating[2]);
    connect(zone_3.T_setHeating, T_setHeating[3]);
    connect(zone_4.T_setHeating, T_setHeating[4]);
    connect(zone_5.T_setHeating, T_setHeating[5]);
    connect(zone_6.T_setHeating, T_setHeating[6]);
  // Cooling set temperatures of each thermal zones
    connect(zone_1.T_setCooling, T_setCooling[1]);
    connect(zone_2.T_setCooling, T_setCooling[2]);
    connect(zone_3.T_setCooling, T_setCooling[3]);
    connect(zone_4.T_setCooling, T_setCooling[4]);
    connect(zone_5.T_setCooling, T_setCooling[5]);
    connect(zone_6.T_setCooling, T_setCooling[6]);
  // airchange rates of each thermal zones
    connect(zone_1.airchange, airchange[1]);
    connect(zone_2.airchange, airchange[2]);
    connect(zone_3.airchange, airchange[3]);
    connect(zone_4.airchange, airchange[4]);
    connect(zone_5.airchange, airchange[5]);
    connect(zone_6.airchange, airchange[6]);
  // ambient temperature of each thermal zones
    connect(zone_1.TAirAmb, TAirAmb);
    connect(zone_2.TAirAmb, TAirAmb);
    connect(zone_3.TAirAmb, TAirAmb);
    connect(zone_4.TAirAmb, TAirAmb);
    connect(zone_5.TAirAmb, TAirAmb);
    connect(zone_6.TAirAmb, TAirAmb);
  // ambient moisture of each thermal zones
    connect(zone_1.xAirAmb, xAirAmb);
    connect(zone_2.xAirAmb, xAirAmb);
    connect(zone_3.xAirAmb, xAirAmb);
    connect(zone_4.xAirAmb, xAirAmb);
    connect(zone_5.xAirAmb, xAirAmb);
    connect(zone_6.xAirAmb, xAirAmb);
  // Cooling load of each thermal zones
    connect(zone_1.Q_flow_cooling, Q_flow_cooling[1]);
    connect(zone_2.Q_flow_cooling, Q_flow_cooling[2]);
    connect(zone_3.Q_flow_cooling, Q_flow_cooling[3]);
    connect(zone_4.Q_flow_cooling, Q_flow_cooling[4]);
    connect(zone_5.Q_flow_cooling, Q_flow_cooling[5]);
    connect(zone_6.Q_flow_cooling, Q_flow_cooling[6]);
  // Heating load of each thermal zones
    connect(zone_1.Q_flow_heating, Q_flow_heating[1]);
    connect(zone_2.Q_flow_heating, Q_flow_heating[2]);
    connect(zone_3.Q_flow_heating, Q_flow_heating[3]);
    connect(zone_4.Q_flow_heating, Q_flow_heating[4]);
    connect(zone_5.Q_flow_heating, Q_flow_heating[5]);
    connect(zone_6.Q_flow_heating, Q_flow_heating[6]);
  // Radiative heating source of each thermal zones
    connect(zone_1.radHeatSourcesPorts[1], radHeatSourcesPorts[1]);
    connect(zone_2.radHeatSourcesPorts[1], radHeatSourcesPorts[2]);
    connect(zone_3.radHeatSourcesPorts[1], radHeatSourcesPorts[3]);
    connect(zone_4.radHeatSourcesPorts[1], radHeatSourcesPorts[4]);
    connect(zone_5.radHeatSourcesPorts[1], radHeatSourcesPorts[5]);
    connect(zone_6.radHeatSourcesPorts[1], radHeatSourcesPorts[6]);
  // Convective heating source of each thermal zones
    connect(zone_1.conHeatSourcesPorts[1], conHeatSourcesPorts[1]);
    connect(zone_2.conHeatSourcesPorts[1], conHeatSourcesPorts[2]);
    connect(zone_3.conHeatSourcesPorts[1], conHeatSourcesPorts[3]);
    connect(zone_4.conHeatSourcesPorts[1], conHeatSourcesPorts[4]);
    connect(zone_5.conHeatSourcesPorts[1], conHeatSourcesPorts[5]);
    connect(zone_6.conHeatSourcesPorts[1], conHeatSourcesPorts[6]);
  end Building;

  Building building(
    nZones = 6)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces = building.nSurfacesAmbient,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    // Heating set temperature of the thermal zones
    Modelica.Blocks.Sources.Constant TSetHeating_zone_1(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_2(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_3(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_4(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_5(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_6(k=273.15 + 20.0);
    // Cooling set temperature of each thermal zones
    Modelica.Blocks.Sources.Constant TSetCooling_zone_1(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_2(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_3(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_4(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_5(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_6(k=273.15 + 24.0);
    // Air change rate of each thermal zones
    Modelica.Blocks.Sources.Constant airchange_zone_1(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_2(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_3(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_4(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_5(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_6(k=0.5);
    // Heating source of each thermal zones
    Modelica.Blocks.Sources.Constant heatsources_zone_1(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_2(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_3(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_4(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_5(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_6(k=0.0);
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatFlow[6];
    BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relationRadiationConvection[6](each radiationportion = 0.5);
  equation
    connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
      annotation (Line(points={{-12,4},{11,4}},color={0,255,0},smooth=Smooth.None));
    connect(ambient.toAirPorts, building.toAmbientAirPorts)
      annotation (Line(points={{-12,-4},{11,-4}},color={85,170,255},smooth=Smooth.None));
    connect(ambient.TAirRef, building.TAirAmb)
      annotation (Line(points={{-28.2,7},{-30,7},{-30,12},{-30,14},{26.2,14},{26.2,9.8}}, color={0,0,127}));
    connect(ambient.xAir, building.xAirAmb)
      annotation (Line(points={{-28.2,5},{-32,5},{-32,16},{28.4,16},{28.4,9.8}}, color={0,0,127}));
    // Heating set temperature of each thermal zones
    connect(TSetHeating_zone_1.y, building.T_setHeating[1]);
    connect(TSetHeating_zone_2.y, building.T_setHeating[2]);
    connect(TSetHeating_zone_3.y, building.T_setHeating[3]);
    connect(TSetHeating_zone_4.y, building.T_setHeating[4]);
    connect(TSetHeating_zone_5.y, building.T_setHeating[5]);
    connect(TSetHeating_zone_6.y, building.T_setHeating[6]);
    // Cooling set temperature of each thermal zones
    connect(TSetCooling_zone_1.y, building.T_setCooling[1]);
    connect(TSetCooling_zone_2.y, building.T_setCooling[2]);
    connect(TSetCooling_zone_3.y, building.T_setCooling[3]);
    connect(TSetCooling_zone_4.y, building.T_setCooling[4]);
    connect(TSetCooling_zone_5.y, building.T_setCooling[5]);
    connect(TSetCooling_zone_6.y, building.T_setCooling[6]);
    // Air change rate of each thermal zones
    connect(airchange_zone_1.y, building.airchange[1]);
    connect(airchange_zone_2.y, building.airchange[2]);
    connect(airchange_zone_3.y, building.airchange[3]);
    connect(airchange_zone_4.y, building.airchange[4]);
    connect(airchange_zone_5.y, building.airchange[5]);
    connect(airchange_zone_6.y, building.airchange[6]);
    // Heating source of each thermal zones
    connect(heatsources_zone_1.y, heatFlow[1].Q_flow);
    connect(heatsources_zone_2.y, heatFlow[2].Q_flow);
    connect(heatsources_zone_3.y, heatFlow[3].Q_flow);
    connect(heatsources_zone_4.y, heatFlow[4].Q_flow);
    connect(heatsources_zone_5.y, heatFlow[5].Q_flow);
    connect(heatsources_zone_6.y, heatFlow[6].Q_flow);
    connect(relationRadiationConvection.heatPort, heatFlow.port);
    connect(relationRadiationConvection.heatPortCv, building.conHeatSourcesPorts[1:6]);
    connect(relationRadiationConvection.heatPortLw, building.radHeatSourcesPorts[1:6]);

  annotation(experiment(StartTime=0, StopTime=31536000, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));

  end SWW4_SB;
