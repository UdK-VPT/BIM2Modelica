within ModelicaModels.IFC2X3.UdKB_Test_Cases;
model MultiZoneBuilding
  "Model of a building with its climate ambient"
  extends Modelica.Icons.Example;

  record Construction1
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=3,
      thickness={
        0.020,
        0.060,
        0.200
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction1;
  record Construction2
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=4,
      thickness={
        0.020,
        0.150,
        0.200,
        0.015
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction2;
  record Construction3
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=3,
      thickness={
        0.015,
        0.120,
        0.015
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction3;
  record Construction4
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.050
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction4;

  model Building
    "Automatically generated multi-zone building model"
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 13,
    surfacesToAmbient(nSurfaces = 43),
    nSurfacesSolid = 0,
    surfacesToSolids(nSurfaces = nSurfacesSolid),
    convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    useAirPaths = false,
    heatSources = true,
    nHeatSources = 13);

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_1(
      V=40.26712500000001,
      height=3.0,
      nConstructions=6,
      //nConstructions=7,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_2(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_3(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_4(
      V=40.26712500000001,
      height=3.0,
      nConstructions=6,
      //nConstructions=7,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_5(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_6(
      V=51.029999999999994,
      height=3.0,
      nConstructions=8,
      //nConstructions=9,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_7(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_8(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_9(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_10(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_11(
      V=32.400000000000006,
      height=3.0,
      nConstructions=7,
      //nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_12(
      V=135.27,
      height=3.0,
      nConstructions=27,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_13(
      V=401.76000000000005,
      height=3.0,
      nConstructions=10,
      //nConstructions=11,
      heatSources=true,
      nHeatSources=1);

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_1(
      redeclare Construction3 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.85);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_2(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 3.075);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_3(
      redeclare Construction2 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = -0.0,
      height = 2.7,
      width = 4.85);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_4(
      redeclare Construction3 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.075);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_1(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.075,
      width = 4.85);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_1(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_5(
      redeclare Construction3 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_6(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_7(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_8(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_2(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_2(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_9(
      redeclare Construction3 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_10(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_11(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_3(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_3(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_12(
      redeclare Construction3 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.85);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_13(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 3.075);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_14(
      redeclare Construction3 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.075);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_4(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.075,
      width = 4.85);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_4(
      redeclare Construction1 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_15(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_16(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_17(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_5(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_5(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_18(
      redeclare Construction2 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 12.25,
      height = 2.7,
      width = 6.3);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_19(
      redeclare Construction2 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_20(
      redeclare Construction3 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_6(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 6.3);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_6(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_21(
      redeclare Construction3 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_22(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_23(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_7(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_7(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_24(
      redeclare Construction3 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_25(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_26(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_8(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_8(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_27(
      redeclare Construction2 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_28(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_29(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_9(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_9(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_30(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_31(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_32(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_10(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_10(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_33(
      redeclare Construction2 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.7,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_34(
      redeclare Construction2 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 3.875,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_35(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 3.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_11(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 3.0,
      width = 4.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_11(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_36(
      redeclare Construction2 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 2.6,
      height = 2.7,
      width = 2.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_37(
      redeclare Construction3 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 2.0,
      height = 2.7,
      width = 18.6);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_38(
      redeclare Construction2 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 2.6,
      height = 2.7,
      width = 2.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_12(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 25.05);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_12(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = -0.0,
      height = 2.0,
      width = 1.3);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_13(
      redeclare Construction1 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.0,
      width = 1.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes door_14(
      redeclare Construction1 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = -0.0,
      height = 2.0,
      width = 1.3);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_39(
      redeclare Construction2 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 7.75,
      height = 2.7,
      width = 8.0);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_40(
      redeclare Construction2 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 39.2,
      height = 2.7,
      width = 18.6);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_13(
      redeclare Construction1 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 8.0,
      width = 18.6);

    BuildingSystems.Buildings.Constructions.Windows.Window window_1(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_2(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_3(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_4(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height = 2.55,
      width = 5.0);
    BuildingSystems.Buildings.Constructions.Windows.Window window_5(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_6(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_7(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_8(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_9(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 2.5);
    BuildingSystems.Buildings.Constructions.Windows.Window window_10(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      height = 1.55,
      width = 5.0);
    BuildingSystems.Buildings.Constructions.Windows.Window window_11(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height = 2.55,
      width = 16.0);
  equation
    // connections between construction elements and zones
    connect(wall_1.toSurfacePort_1, zone_1.toConstructionPorts[1]);
    connect(wall_2.toSurfacePort_1, zone_1.toConstructionPorts[2]);
    connect(wall_3.toSurfacePort_1, zone_1.toConstructionPorts[3]);
    connect(wall_4.toSurfacePort_1, zone_1.toConstructionPorts[4]);
    connect(slab_1.toSurfacePort_1, zone_1.toConstructionPorts[5]);
    connect(door_1.toSurfacePort_1, zone_1.toConstructionPorts[6]);
    connect(wall_1.toSurfacePort_2, zone_4.toConstructionPorts[1]);
    connect(wall_12.toSurfacePort_1, zone_4.toConstructionPorts[2]);
    connect(wall_13.toSurfacePort_1, zone_4.toConstructionPorts[3]);
    connect(wall_14.toSurfacePort_1, zone_4.toConstructionPorts[4]);
    connect(slab_4.toSurfacePort_1, zone_4.toConstructionPorts[5]);
    connect(door_4.toSurfacePort_1, zone_4.toConstructionPorts[6]);
    connect(wall_2.toSurfacePort_2, zone_6.toConstructionPorts[1]);
    connect(wall_13.toSurfacePort_2, zone_6.toConstructionPorts[2]);
    connect(wall_18.toSurfacePort_1, zone_6.toConstructionPorts[3]);
    connect(wall_19.toSurfacePort_1, zone_6.toConstructionPorts[4]);
    connect(wall_20.toSurfacePort_1, zone_6.toConstructionPorts[5]);
    connect(slab_6.toSurfacePort_1, zone_6.toConstructionPorts[6]);
    connect(door_6.toSurfacePort_1, zone_6.toConstructionPorts[7]);
    connect(window_4.toSurfacePort_1, zone_6.toConstructionPorts[8]);
    connect(wall_4.toSurfacePort_2, zone_12.toConstructionPorts[1]);
    connect(door_1.toSurfacePort_2, zone_12.toConstructionPorts[2]);
    connect(wall_6.toSurfacePort_2, zone_12.toConstructionPorts[3]);
    connect(door_2.toSurfacePort_2, zone_12.toConstructionPorts[4]);
    connect(wall_10.toSurfacePort_2, zone_12.toConstructionPorts[5]);
    connect(door_3.toSurfacePort_2, zone_12.toConstructionPorts[6]);
    connect(wall_14.toSurfacePort_2, zone_12.toConstructionPorts[7]);
    connect(door_4.toSurfacePort_2, zone_12.toConstructionPorts[8]);
    connect(wall_15.toSurfacePort_2, zone_12.toConstructionPorts[9]);
    connect(door_5.toSurfacePort_2, zone_12.toConstructionPorts[10]);
    connect(wall_22.toSurfacePort_2, zone_12.toConstructionPorts[11]);
    connect(door_7.toSurfacePort_2, zone_12.toConstructionPorts[12]);
    connect(wall_25.toSurfacePort_2, zone_12.toConstructionPorts[13]);
    connect(door_8.toSurfacePort_2, zone_12.toConstructionPorts[14]);
    connect(wall_28.toSurfacePort_2, zone_12.toConstructionPorts[15]);
    connect(door_9.toSurfacePort_2, zone_12.toConstructionPorts[16]);
    connect(wall_30.toSurfacePort_2, zone_12.toConstructionPorts[17]);
    connect(door_10.toSurfacePort_2, zone_12.toConstructionPorts[18]);
    connect(wall_35.toSurfacePort_2, zone_12.toConstructionPorts[19]);
    connect(door_11.toSurfacePort_2, zone_12.toConstructionPorts[20]);
    connect(wall_36.toSurfacePort_1, zone_12.toConstructionPorts[21]);
    connect(wall_37.toSurfacePort_1, zone_12.toConstructionPorts[22]);
    connect(wall_38.toSurfacePort_1, zone_12.toConstructionPorts[23]);
    connect(slab_12.toSurfacePort_1, zone_12.toConstructionPorts[24]);
    connect(door_12.toSurfacePort_1, zone_12.toConstructionPorts[25]);
    connect(door_13.toSurfacePort_1, zone_12.toConstructionPorts[26]);
    connect(door_14.toSurfacePort_1, zone_12.toConstructionPorts[27]);
    connect(wall_5.toSurfacePort_1, zone_2.toConstructionPorts[1]);
    connect(wall_6.toSurfacePort_1, zone_2.toConstructionPorts[2]);
    connect(wall_7.toSurfacePort_1, zone_2.toConstructionPorts[3]);
    connect(wall_8.toSurfacePort_1, zone_2.toConstructionPorts[4]);
    connect(slab_2.toSurfacePort_1, zone_2.toConstructionPorts[5]);
    connect(door_2.toSurfacePort_1, zone_2.toConstructionPorts[6]);
    connect(window_1.toSurfacePort_1, zone_2.toConstructionPorts[7]);
    connect(wall_5.toSurfacePort_2, zone_3.toConstructionPorts[1]);
    connect(wall_9.toSurfacePort_1, zone_3.toConstructionPorts[2]);
    connect(wall_10.toSurfacePort_1, zone_3.toConstructionPorts[3]);
    connect(wall_11.toSurfacePort_1, zone_3.toConstructionPorts[4]);
    connect(slab_3.toSurfacePort_1, zone_3.toConstructionPorts[5]);
    connect(door_3.toSurfacePort_1, zone_3.toConstructionPorts[6]);
    connect(window_2.toSurfacePort_1, zone_3.toConstructionPorts[7]);
    connect(wall_7.toSurfacePort_2, zone_5.toConstructionPorts[1]);
    connect(wall_15.toSurfacePort_1, zone_5.toConstructionPorts[2]);
    connect(wall_16.toSurfacePort_1, zone_5.toConstructionPorts[3]);
    connect(wall_17.toSurfacePort_1, zone_5.toConstructionPorts[4]);
    connect(slab_5.toSurfacePort_1, zone_5.toConstructionPorts[5]);
    connect(door_5.toSurfacePort_1, zone_5.toConstructionPorts[6]);
    connect(window_3.toSurfacePort_1, zone_5.toConstructionPorts[7]);
    connect(wall_9.toSurfacePort_2, zone_7.toConstructionPorts[1]);
    connect(wall_21.toSurfacePort_1, zone_7.toConstructionPorts[2]);
    connect(wall_22.toSurfacePort_1, zone_7.toConstructionPorts[3]);
    connect(wall_23.toSurfacePort_1, zone_7.toConstructionPorts[4]);
    connect(slab_7.toSurfacePort_1, zone_7.toConstructionPorts[5]);
    connect(door_7.toSurfacePort_1, zone_7.toConstructionPorts[6]);
    connect(window_5.toSurfacePort_1, zone_7.toConstructionPorts[7]);
    connect(wall_12.toSurfacePort_2, zone_13.toConstructionPorts[1]);
    connect(wall_20.toSurfacePort_2, zone_13.toConstructionPorts[2]);
    connect(door_6.toSurfacePort_2, zone_13.toConstructionPorts[3]);
    connect(wall_37.toSurfacePort_2, zone_13.toConstructionPorts[4]);
    connect(door_13.toSurfacePort_2, zone_13.toConstructionPorts[5]);
    connect(wall_39.toSurfacePort_1, zone_13.toConstructionPorts[6]);
    connect(wall_40.toSurfacePort_1, zone_13.toConstructionPorts[7]);
    connect(slab_13.toSurfacePort_1, zone_13.toConstructionPorts[8]);
    connect(window_10.toSurfacePort_1, zone_13.toConstructionPorts[9]);
    connect(window_11.toSurfacePort_1, zone_13.toConstructionPorts[10]);
    connect(wall_16.toSurfacePort_2, zone_10.toConstructionPorts[1]);
    connect(wall_30.toSurfacePort_1, zone_10.toConstructionPorts[2]);
    connect(wall_31.toSurfacePort_1, zone_10.toConstructionPorts[3]);
    connect(wall_32.toSurfacePort_1, zone_10.toConstructionPorts[4]);
    connect(slab_10.toSurfacePort_1, zone_10.toConstructionPorts[5]);
    connect(door_10.toSurfacePort_1, zone_10.toConstructionPorts[6]);
    connect(window_8.toSurfacePort_1, zone_10.toConstructionPorts[7]);
    connect(wall_21.toSurfacePort_2, zone_8.toConstructionPorts[1]);
    connect(wall_24.toSurfacePort_1, zone_8.toConstructionPorts[2]);
    connect(wall_25.toSurfacePort_1, zone_8.toConstructionPorts[3]);
    connect(wall_26.toSurfacePort_1, zone_8.toConstructionPorts[4]);
    connect(slab_8.toSurfacePort_1, zone_8.toConstructionPorts[5]);
    connect(door_8.toSurfacePort_1, zone_8.toConstructionPorts[6]);
    connect(window_6.toSurfacePort_1, zone_8.toConstructionPorts[7]);
    connect(wall_24.toSurfacePort_2, zone_9.toConstructionPorts[1]);
    connect(wall_27.toSurfacePort_1, zone_9.toConstructionPorts[2]);
    connect(wall_28.toSurfacePort_1, zone_9.toConstructionPorts[3]);
    connect(wall_29.toSurfacePort_1, zone_9.toConstructionPorts[4]);
    connect(slab_9.toSurfacePort_1, zone_9.toConstructionPorts[5]);
    connect(door_9.toSurfacePort_1, zone_9.toConstructionPorts[6]);
    connect(window_7.toSurfacePort_1, zone_9.toConstructionPorts[7]);
    connect(wall_31.toSurfacePort_2, zone_11.toConstructionPorts[1]);
    connect(wall_33.toSurfacePort_1, zone_11.toConstructionPorts[2]);
    connect(wall_34.toSurfacePort_1, zone_11.toConstructionPorts[3]);
    connect(wall_35.toSurfacePort_1, zone_11.toConstructionPorts[4]);
    connect(slab_11.toSurfacePort_1, zone_11.toConstructionPorts[5]);
    connect(door_11.toSurfacePort_1, zone_11.toConstructionPorts[6]);
    connect(window_9.toSurfacePort_1, zone_11.toConstructionPorts[7]);
    // connections between construction elements and ambient
    connect(wall_3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1]);
    connect(slab_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2]);
    connect(wall_8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3]);
    connect(slab_2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4]);
    connect(wall_11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5]);
    connect(slab_3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6]);
    connect(slab_4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7]);
    connect(wall_17.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8]);
    connect(slab_5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9]);
    connect(wall_18.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10]);
    connect(wall_19.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11]);
    connect(slab_6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12]);
    connect(wall_23.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[13]);
    connect(slab_7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[14]);
    connect(wall_26.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[15]);
    connect(slab_8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[16]);
    connect(wall_27.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[17]);
    connect(wall_29.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[18]);
    connect(slab_9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[19]);
    connect(wall_32.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[20]);
    connect(slab_10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[21]);
    connect(wall_33.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[22]);
    connect(wall_34.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[23]);
    connect(slab_11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[24]);
    connect(wall_36.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[25]);
    connect(wall_38.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[26]);
    connect(slab_12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[27]);
    connect(door_12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[28]);
    connect(door_14.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[29]);
    connect(wall_39.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[30]);
    connect(wall_40.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[31]);
    connect(slab_13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[32]);
    connect(window_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[33]);
    connect(window_2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[34]);
    connect(window_3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[35]);
    connect(window_4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[36]);
    connect(window_5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[37]);
    connect(window_6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[38]);
    connect(window_7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[39]);
    connect(window_8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[40]);
    connect(window_9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[41]);
    connect(window_10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[42]);
    connect(window_11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[43]);
    // connections between construction elements and ground
  // Heating set temperature of each thermal zones
    connect(zone_1.T_setHeating, T_setHeating[1]);
    connect(zone_2.T_setHeating, T_setHeating[2]);
    connect(zone_3.T_setHeating, T_setHeating[3]);
    connect(zone_4.T_setHeating, T_setHeating[4]);
    connect(zone_5.T_setHeating, T_setHeating[5]);
    connect(zone_6.T_setHeating, T_setHeating[6]);
    connect(zone_7.T_setHeating, T_setHeating[7]);
    connect(zone_8.T_setHeating, T_setHeating[8]);
    connect(zone_9.T_setHeating, T_setHeating[9]);
    connect(zone_10.T_setHeating, T_setHeating[10]);
    connect(zone_11.T_setHeating, T_setHeating[11]);
    connect(zone_12.T_setHeating, T_setHeating[12]);
    connect(zone_13.T_setHeating, T_setHeating[13]);
  // Cooling set temperatures of each thermal zones
    connect(zone_1.T_setCooling, T_setCooling[1]);
    connect(zone_2.T_setCooling, T_setCooling[2]);
    connect(zone_3.T_setCooling, T_setCooling[3]);
    connect(zone_4.T_setCooling, T_setCooling[4]);
    connect(zone_5.T_setCooling, T_setCooling[5]);
    connect(zone_6.T_setCooling, T_setCooling[6]);
    connect(zone_7.T_setCooling, T_setCooling[7]);
    connect(zone_8.T_setCooling, T_setCooling[8]);
    connect(zone_9.T_setCooling, T_setCooling[9]);
    connect(zone_10.T_setCooling, T_setCooling[10]);
    connect(zone_11.T_setCooling, T_setCooling[11]);
    connect(zone_12.T_setCooling, T_setCooling[12]);
    connect(zone_13.T_setCooling, T_setCooling[13]);
  // airchange rates of each thermal zones
    connect(zone_1.airchange, airchange[1]);
    connect(zone_2.airchange, airchange[2]);
    connect(zone_3.airchange, airchange[3]);
    connect(zone_4.airchange, airchange[4]);
    connect(zone_5.airchange, airchange[5]);
    connect(zone_6.airchange, airchange[6]);
    connect(zone_7.airchange, airchange[7]);
    connect(zone_8.airchange, airchange[8]);
    connect(zone_9.airchange, airchange[9]);
    connect(zone_10.airchange, airchange[10]);
    connect(zone_11.airchange, airchange[11]);
    connect(zone_12.airchange, airchange[12]);
    connect(zone_13.airchange, airchange[13]);
  // ambient temperature of each thermal zones
    connect(zone_1.TAirAmb, TAirAmb);
    connect(zone_2.TAirAmb, TAirAmb);
    connect(zone_3.TAirAmb, TAirAmb);
    connect(zone_4.TAirAmb, TAirAmb);
    connect(zone_5.TAirAmb, TAirAmb);
    connect(zone_6.TAirAmb, TAirAmb);
    connect(zone_7.TAirAmb, TAirAmb);
    connect(zone_8.TAirAmb, TAirAmb);
    connect(zone_9.TAirAmb, TAirAmb);
    connect(zone_10.TAirAmb, TAirAmb);
    connect(zone_11.TAirAmb, TAirAmb);
    connect(zone_12.TAirAmb, TAirAmb);
    connect(zone_13.TAirAmb, TAirAmb);
  // ambient moisture of each thermal zones
    connect(zone_1.xAirAmb, xAirAmb);
    connect(zone_2.xAirAmb, xAirAmb);
    connect(zone_3.xAirAmb, xAirAmb);
    connect(zone_4.xAirAmb, xAirAmb);
    connect(zone_5.xAirAmb, xAirAmb);
    connect(zone_6.xAirAmb, xAirAmb);
    connect(zone_7.xAirAmb, xAirAmb);
    connect(zone_8.xAirAmb, xAirAmb);
    connect(zone_9.xAirAmb, xAirAmb);
    connect(zone_10.xAirAmb, xAirAmb);
    connect(zone_11.xAirAmb, xAirAmb);
    connect(zone_12.xAirAmb, xAirAmb);
    connect(zone_13.xAirAmb, xAirAmb);
  // Cooling load of each thermal zones
    connect(zone_1.Q_flow_cooling, Q_flow_cooling[1]);
    connect(zone_2.Q_flow_cooling, Q_flow_cooling[2]);
    connect(zone_3.Q_flow_cooling, Q_flow_cooling[3]);
    connect(zone_4.Q_flow_cooling, Q_flow_cooling[4]);
    connect(zone_5.Q_flow_cooling, Q_flow_cooling[5]);
    connect(zone_6.Q_flow_cooling, Q_flow_cooling[6]);
    connect(zone_7.Q_flow_cooling, Q_flow_cooling[7]);
    connect(zone_8.Q_flow_cooling, Q_flow_cooling[8]);
    connect(zone_9.Q_flow_cooling, Q_flow_cooling[9]);
    connect(zone_10.Q_flow_cooling, Q_flow_cooling[10]);
    connect(zone_11.Q_flow_cooling, Q_flow_cooling[11]);
    connect(zone_12.Q_flow_cooling, Q_flow_cooling[12]);
    connect(zone_13.Q_flow_cooling, Q_flow_cooling[13]);
  // Heating load of each thermal zones
    connect(zone_1.Q_flow_heating, Q_flow_heating[1]);
    connect(zone_2.Q_flow_heating, Q_flow_heating[2]);
    connect(zone_3.Q_flow_heating, Q_flow_heating[3]);
    connect(zone_4.Q_flow_heating, Q_flow_heating[4]);
    connect(zone_5.Q_flow_heating, Q_flow_heating[5]);
    connect(zone_6.Q_flow_heating, Q_flow_heating[6]);
    connect(zone_7.Q_flow_heating, Q_flow_heating[7]);
    connect(zone_8.Q_flow_heating, Q_flow_heating[8]);
    connect(zone_9.Q_flow_heating, Q_flow_heating[9]);
    connect(zone_10.Q_flow_heating, Q_flow_heating[10]);
    connect(zone_11.Q_flow_heating, Q_flow_heating[11]);
    connect(zone_12.Q_flow_heating, Q_flow_heating[12]);
    connect(zone_13.Q_flow_heating, Q_flow_heating[13]);
  // Radiative heating source of each thermal zones
    connect(zone_1.radHeatSourcesPorts[1], radHeatSourcesPorts[1]);
    connect(zone_2.radHeatSourcesPorts[1], radHeatSourcesPorts[2]);
    connect(zone_3.radHeatSourcesPorts[1], radHeatSourcesPorts[3]);
    connect(zone_4.radHeatSourcesPorts[1], radHeatSourcesPorts[4]);
    connect(zone_5.radHeatSourcesPorts[1], radHeatSourcesPorts[5]);
    connect(zone_6.radHeatSourcesPorts[1], radHeatSourcesPorts[6]);
    connect(zone_7.radHeatSourcesPorts[1], radHeatSourcesPorts[7]);
    connect(zone_8.radHeatSourcesPorts[1], radHeatSourcesPorts[8]);
    connect(zone_9.radHeatSourcesPorts[1], radHeatSourcesPorts[9]);
    connect(zone_10.radHeatSourcesPorts[1], radHeatSourcesPorts[10]);
    connect(zone_11.radHeatSourcesPorts[1], radHeatSourcesPorts[11]);
    connect(zone_12.radHeatSourcesPorts[1], radHeatSourcesPorts[12]);
    connect(zone_13.radHeatSourcesPorts[1], radHeatSourcesPorts[13]);
  // Convective heating source of each thermal zones
    connect(zone_1.conHeatSourcesPorts[1], conHeatSourcesPorts[1]);
    connect(zone_2.conHeatSourcesPorts[1], conHeatSourcesPorts[2]);
    connect(zone_3.conHeatSourcesPorts[1], conHeatSourcesPorts[3]);
    connect(zone_4.conHeatSourcesPorts[1], conHeatSourcesPorts[4]);
    connect(zone_5.conHeatSourcesPorts[1], conHeatSourcesPorts[5]);
    connect(zone_6.conHeatSourcesPorts[1], conHeatSourcesPorts[6]);
    connect(zone_7.conHeatSourcesPorts[1], conHeatSourcesPorts[7]);
    connect(zone_8.conHeatSourcesPorts[1], conHeatSourcesPorts[8]);
    connect(zone_9.conHeatSourcesPorts[1], conHeatSourcesPorts[9]);
    connect(zone_10.conHeatSourcesPorts[1], conHeatSourcesPorts[10]);
    connect(zone_11.conHeatSourcesPorts[1], conHeatSourcesPorts[11]);
    connect(zone_12.conHeatSourcesPorts[1], conHeatSourcesPorts[12]);
    connect(zone_13.conHeatSourcesPorts[1], conHeatSourcesPorts[13]);
  end Building;

  Building building(
    nZones = 13)
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
    Modelica.Blocks.Sources.Constant TSetHeating_zone_7(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_8(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_9(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_10(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_11(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_12(k=273.15 + 20.0);
    Modelica.Blocks.Sources.Constant TSetHeating_zone_13(k=273.15 + 20.0);
    // Cooling set temperature of each thermal zones
    Modelica.Blocks.Sources.Constant TSetCooling_zone_1(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_2(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_3(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_4(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_5(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_6(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_7(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_8(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_9(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_10(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_11(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_12(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_13(k=273.15 + 24.0);
    // Air change rate of each thermal zones
    Modelica.Blocks.Sources.Constant airchange_zone_1(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_2(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_3(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_4(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_5(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_6(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_7(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_8(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_9(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_10(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_11(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_12(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_13(k=0.5);
    // Heating source of each thermal zones
    Modelica.Blocks.Sources.Constant heatsources_zone_1(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_2(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_3(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_4(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_5(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_6(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_7(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_8(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_9(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_10(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_11(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_12(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_13(k=0.0);
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatFlow[13];
    BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relationRadiationConvection[13](each radiationportion = 0.5);
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
    connect(TSetHeating_zone_7.y, building.T_setHeating[7]);
    connect(TSetHeating_zone_8.y, building.T_setHeating[8]);
    connect(TSetHeating_zone_9.y, building.T_setHeating[9]);
    connect(TSetHeating_zone_10.y, building.T_setHeating[10]);
    connect(TSetHeating_zone_11.y, building.T_setHeating[11]);
    connect(TSetHeating_zone_12.y, building.T_setHeating[12]);
    connect(TSetHeating_zone_13.y, building.T_setHeating[13]);
    // Cooling set temperature of each thermal zones
    connect(TSetCooling_zone_1.y, building.T_setCooling[1]);
    connect(TSetCooling_zone_2.y, building.T_setCooling[2]);
    connect(TSetCooling_zone_3.y, building.T_setCooling[3]);
    connect(TSetCooling_zone_4.y, building.T_setCooling[4]);
    connect(TSetCooling_zone_5.y, building.T_setCooling[5]);
    connect(TSetCooling_zone_6.y, building.T_setCooling[6]);
    connect(TSetCooling_zone_7.y, building.T_setCooling[7]);
    connect(TSetCooling_zone_8.y, building.T_setCooling[8]);
    connect(TSetCooling_zone_9.y, building.T_setCooling[9]);
    connect(TSetCooling_zone_10.y, building.T_setCooling[10]);
    connect(TSetCooling_zone_11.y, building.T_setCooling[11]);
    connect(TSetCooling_zone_12.y, building.T_setCooling[12]);
    connect(TSetCooling_zone_13.y, building.T_setCooling[13]);
    // Air change rate of each thermal zones
    connect(airchange_zone_1.y, building.airchange[1]);
    connect(airchange_zone_2.y, building.airchange[2]);
    connect(airchange_zone_3.y, building.airchange[3]);
    connect(airchange_zone_4.y, building.airchange[4]);
    connect(airchange_zone_5.y, building.airchange[5]);
    connect(airchange_zone_6.y, building.airchange[6]);
    connect(airchange_zone_7.y, building.airchange[7]);
    connect(airchange_zone_8.y, building.airchange[8]);
    connect(airchange_zone_9.y, building.airchange[9]);
    connect(airchange_zone_10.y, building.airchange[10]);
    connect(airchange_zone_11.y, building.airchange[11]);
    connect(airchange_zone_12.y, building.airchange[12]);
    connect(airchange_zone_13.y, building.airchange[13]);
    // Heating source of each thermal zones
    connect(heatsources_zone_1.y, heatFlow[1].Q_flow);
    connect(heatsources_zone_2.y, heatFlow[2].Q_flow);
    connect(heatsources_zone_3.y, heatFlow[3].Q_flow);
    connect(heatsources_zone_4.y, heatFlow[4].Q_flow);
    connect(heatsources_zone_5.y, heatFlow[5].Q_flow);
    connect(heatsources_zone_6.y, heatFlow[6].Q_flow);
    connect(heatsources_zone_7.y, heatFlow[7].Q_flow);
    connect(heatsources_zone_8.y, heatFlow[8].Q_flow);
    connect(heatsources_zone_9.y, heatFlow[9].Q_flow);
    connect(heatsources_zone_10.y, heatFlow[10].Q_flow);
    connect(heatsources_zone_11.y, heatFlow[11].Q_flow);
    connect(heatsources_zone_12.y, heatFlow[12].Q_flow);
    connect(heatsources_zone_13.y, heatFlow[13].Q_flow);
    connect(relationRadiationConvection.heatPort, heatFlow.port);
    connect(relationRadiationConvection.heatPortCv, building.conHeatSourcesPorts[1:13]);
    connect(relationRadiationConvection.heatPortLw, building.radHeatSourcesPorts[1:13]);

  annotation(experiment(StartTime=0, StopTime=31536000, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));

  end MultiZoneBuilding;
