within ModelicaModels.IFC2X3.UdKB_Test_Cases;
model RooftopBuilding3ZonesThin
  "Model of a building with its climate ambient"
  extends Modelica.Icons.Example;

  record Construction1
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.160
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction1;
  record Construction2
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.320
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction2;
  record Construction3
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.100
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction3;
  record Construction4
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.337
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction4;
  record Construction5
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.270
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction5;
  record Construction6
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.135
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction6;
  record Construction7
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.235
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction7;
  record Construction8
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.250
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction8;
  record Construction9
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.30
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction9;
  record Construction10
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.347
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction10;
  record Construction11
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.317
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction11;
  record Construction12
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.3505
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction12;
  record Construction13
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.332
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction13;
  record Construction14
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={
        0.350
      },
      material={
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()
      });
  end Construction14;

  model Building
    "Automatically generated multi-zone building model"
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 7,
    surfacesToAmbient(nSurfaces = 41),
    nSurfacesSolid = 0,
    surfacesToSolids(nSurfaces = nSurfacesSolid),
    convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    useAirPaths = false,
    heatSources = true,
    nHeatSources = 7);

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_1(
      V=36.54874911706399,
      height=3.0,
      //nConstructions=22,
      nConstructions=18,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_2(
      V=35.09808750210856,
      height=3.0,
      //nConstructions=18,
      nConstructions=13,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_3(
      V=36.874553999999996,
      height=3.0,
      //nConstructions=10,
      nConstructions=8,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_4(
      V=19.730265000000003,
      height=3.0,
      //nConstructions=10,
      nConstructions=7,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_5(
      V=11.34642,
      height=3.0,
      //nConstructions=12,
      nConstructions=11,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_6(
      V=8.257824,
      height=3.0,
      //nConstructions=12,
      nConstructions=11,
      heatSources=true,
      nHeatSources=1);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone_7(
      V=4.49466875,
      height=3.0,
      //nConstructions=9,
      nConstructions=7,
      heatSources=true,
      nHeatSources=1);

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_1(
      redeclare Construction4 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.9550596799999997);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_2(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.41000000000000014);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_3(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.7599999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_4(
      redeclare Construction5 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.2700000000000009);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_5(
      redeclare Construction7 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.10000000000000014);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_6(
      redeclare Construction9 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 1.9000000000000004);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_7(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.11499999999999932);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_8(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.7600000000000007);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_9(
      redeclare Construction3 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.33999999999999986);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_10(
      redeclare Construction4 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.9550596799999997);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_1(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.7949999999999985,
      width = 0.9550597000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_2(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.8750597,
      width = 8.105999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_3(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.08000000000000007,
      width = 8.105999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_4(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.9550597000000001,
      width = 1.6100000000000003);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_5(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.8750597,
      width = 2.7600000000000002);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_6(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.08000000000000007,
      width = 2.76);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_7(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.5599999999999996,
      width = 0.9550597000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_8(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.4780000000000006,
      width = 0.9550597000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_11(
      redeclare Construction4 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.91715227);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_12(
      redeclare Construction4 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.6971522700000025);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_13(
      redeclare Construction4 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.22000000000000064);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_14(
      redeclare Construction6 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.1349999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_15(
      redeclare Construction9 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 1.9000000000000017);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_9(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = -0.0,
      height = 0.7949999999999982,
      width = 0.917152270000003);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_10(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.08000000000000007,
      width = 8.105999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_11(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.8371522700000025,
      width = 8.105999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_12(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.4750000000000002,
      width = 0.9171522700000002);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_13(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.8371522700000006,
      width = 2.76);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_14(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.08000000000000007,
      width = 2.76);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_15(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.5599999999999996,
      width = 0.9171522700000008);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_16(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.9171522700000011,
      width = 1.6100000000000003);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_16(
      redeclare Construction4 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 2.28);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_17(
      redeclare Construction6 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.5900000000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_18(
      redeclare Construction7 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 1.2799999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_19(
      redeclare Construction6 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.06000000000000005);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_17(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 1.99,
      width = 5.571);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_18(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.04999999999999982,
      width = 6.046000000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_19(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.24,
      width = 6.046000000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_20(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.4750000000000014,
      width = 1.99);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_20(
      redeclare Construction4 constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 2.2799999999999994);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_21(
      redeclare Construction5 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.27000000000000024);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_22(
      redeclare Construction5 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 1.9500000000000002);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_21(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 1.99,
      width = 2.76);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_22(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = -0.0,
      height = 0.04999999999999982,
      width = 3.2350000000000003);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_23(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.4750000000000002,
      width = 1.99);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_24(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.24000000000000044,
      width = 3.235);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_23(
      redeclare Construction7 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.69,
      width = 1.2799999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_24(
      redeclare Construction6 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.5700000000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_25(
      redeclare Construction6 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 0.050000000000000266);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_25(
      redeclare Construction10 constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 0.015000000000000013,
      width = 0.6200000000000001);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_26(
      redeclare Construction13 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 1.65,
      width = 1.77);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_27(
      redeclare Construction13 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.5700000000000003,
      width = 1.9);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_28(
      redeclare Construction13 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.1299999999999999,
      width = 1.65);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_26(
      redeclare Construction8 constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      AInnSur = 0.0,
      height = 2.675,
      width = 2.385);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_29(
      redeclare Construction11 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = -0.0,
      height = 0.7799999999999998,
      width = 2.2199999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_30(
      redeclare Construction11 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.16500000000000004,
      width = 0.7799999999999998);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_31(
      redeclare Construction11 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.5,
      width = 2.385);
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes slab_32(
      redeclare Construction10 constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      AInnSur = 0.0,
      height = 0.6499999999999999,
      width = 2.585);

  equation
    // connections between construction elements and zones
    connect(wall_1.toSurfacePort_1, zone_1.toConstructionPorts[1]);
    connect(wall_2.toSurfacePort_1, zone_1.toConstructionPorts[2]);
    connect(wall_3.toSurfacePort_1, zone_1.toConstructionPorts[3]);
    connect(wall_4.toSurfacePort_1, zone_1.toConstructionPorts[4]);
    connect(wall_5.toSurfacePort_1, zone_1.toConstructionPorts[5]);
    connect(wall_6.toSurfacePort_1, zone_1.toConstructionPorts[6]);
    connect(wall_7.toSurfacePort_1, zone_1.toConstructionPorts[7]);
    connect(wall_8.toSurfacePort_1, zone_1.toConstructionPorts[8]);
    connect(wall_9.toSurfacePort_1, zone_1.toConstructionPorts[9]);
    connect(wall_10.toSurfacePort_1, zone_1.toConstructionPorts[10]);
    connect(slab_1.toSurfacePort_1, zone_1.toConstructionPorts[11]);
    connect(slab_2.toSurfacePort_1, zone_1.toConstructionPorts[12]);
    connect(slab_3.toSurfacePort_1, zone_1.toConstructionPorts[13]);
    connect(slab_4.toSurfacePort_1, zone_1.toConstructionPorts[14]);
    connect(slab_5.toSurfacePort_1, zone_1.toConstructionPorts[15]);
    connect(slab_6.toSurfacePort_1, zone_1.toConstructionPorts[16]);
    connect(slab_7.toSurfacePort_1, zone_1.toConstructionPorts[17]);
    connect(slab_8.toSurfacePort_1, zone_1.toConstructionPorts[18]);
    connect(wall_2.toSurfacePort_2, zone_6.toConstructionPorts[1]);
    connect(wall_3.toSurfacePort_2, zone_6.toConstructionPorts[2]);
    connect(wall_7.toSurfacePort_2, zone_6.toConstructionPorts[3]);
    connect(wall_8.toSurfacePort_2, zone_6.toConstructionPorts[4]);
    connect(wall_9.toSurfacePort_2, zone_6.toConstructionPorts[5]);
    connect(wall_18.toSurfacePort_2, zone_6.toConstructionPorts[6]);
    connect(wall_23.toSurfacePort_2, zone_6.toConstructionPorts[7]);
    connect(wall_26.toSurfacePort_1, zone_6.toConstructionPorts[8]);
    connect(slab_29.toSurfacePort_1, zone_6.toConstructionPorts[9]);
    connect(slab_30.toSurfacePort_1, zone_6.toConstructionPorts[10]);
    connect(slab_31.toSurfacePort_1, zone_6.toConstructionPorts[11]);
    connect(wall_5.toSurfacePort_2, zone_7.toConstructionPorts[1]);
    connect(wall_17.toSurfacePort_2, zone_7.toConstructionPorts[2]);
    connect(wall_19.toSurfacePort_2, zone_7.toConstructionPorts[3]);
    connect(wall_24.toSurfacePort_2, zone_7.toConstructionPorts[4]);
    connect(wall_25.toSurfacePort_2, zone_7.toConstructionPorts[5]);
    connect(wall_26.toSurfacePort_2, zone_7.toConstructionPorts[6]);
    connect(slab_32.toSurfacePort_1, zone_7.toConstructionPorts[7]);
    connect(wall_6.toSurfacePort_2, zone_5.toConstructionPorts[1]);
    connect(wall_15.toSurfacePort_2, zone_5.toConstructionPorts[2]);
    connect(wall_21.toSurfacePort_2, zone_5.toConstructionPorts[3]);
    connect(wall_22.toSurfacePort_2, zone_5.toConstructionPorts[4]);
    connect(wall_23.toSurfacePort_1, zone_5.toConstructionPorts[5]);
    connect(wall_24.toSurfacePort_1, zone_5.toConstructionPorts[6]);
    connect(wall_25.toSurfacePort_1, zone_5.toConstructionPorts[7]);
    connect(slab_25.toSurfacePort_1, zone_5.toConstructionPorts[8]);
    connect(slab_26.toSurfacePort_1, zone_5.toConstructionPorts[9]);
    connect(slab_27.toSurfacePort_1, zone_5.toConstructionPorts[10]);
    connect(slab_28.toSurfacePort_1, zone_5.toConstructionPorts[11]);
    connect(wall_11.toSurfacePort_1, zone_2.toConstructionPorts[1]);
    connect(wall_12.toSurfacePort_1, zone_2.toConstructionPorts[2]);
    connect(wall_13.toSurfacePort_1, zone_2.toConstructionPorts[3]);
    connect(wall_14.toSurfacePort_1, zone_2.toConstructionPorts[4]);
    connect(wall_15.toSurfacePort_1, zone_2.toConstructionPorts[5]);
    connect(slab_9.toSurfacePort_1, zone_2.toConstructionPorts[6]);
    connect(slab_10.toSurfacePort_1, zone_2.toConstructionPorts[7]);
    connect(slab_11.toSurfacePort_1, zone_2.toConstructionPorts[8]);
    connect(slab_12.toSurfacePort_1, zone_2.toConstructionPorts[9]);
    connect(slab_13.toSurfacePort_1, zone_2.toConstructionPorts[10]);
    connect(slab_14.toSurfacePort_1, zone_2.toConstructionPorts[11]);
    connect(slab_15.toSurfacePort_1, zone_2.toConstructionPorts[12]);
    connect(slab_16.toSurfacePort_1, zone_2.toConstructionPorts[13]);
    connect(wall_16.toSurfacePort_1, zone_3.toConstructionPorts[1]);
    connect(wall_17.toSurfacePort_1, zone_3.toConstructionPorts[2]);
    connect(wall_18.toSurfacePort_1, zone_3.toConstructionPorts[3]);
    connect(wall_19.toSurfacePort_1, zone_3.toConstructionPorts[4]);
    connect(slab_17.toSurfacePort_1, zone_3.toConstructionPorts[5]);
    connect(slab_18.toSurfacePort_1, zone_3.toConstructionPorts[6]);
    connect(slab_19.toSurfacePort_1, zone_3.toConstructionPorts[7]);
    connect(slab_20.toSurfacePort_1, zone_3.toConstructionPorts[8]);
    connect(wall_20.toSurfacePort_1, zone_4.toConstructionPorts[1]);
    connect(wall_21.toSurfacePort_1, zone_4.toConstructionPorts[2]);
    connect(wall_22.toSurfacePort_1, zone_4.toConstructionPorts[3]);
    connect(slab_21.toSurfacePort_1, zone_4.toConstructionPorts[4]);
    connect(slab_22.toSurfacePort_1, zone_4.toConstructionPorts[5]);
    connect(slab_23.toSurfacePort_1, zone_4.toConstructionPorts[6]);
    connect(slab_24.toSurfacePort_1, zone_4.toConstructionPorts[7]);
    // connections between construction elements and ambient
    connect(wall_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1]);
    connect(wall_4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2]);
    connect(wall_10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3]);
    connect(slab_1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4]);
    connect(slab_2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5]);
    connect(slab_3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6]);
    connect(slab_4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7]);
    connect(slab_5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8]);
    connect(slab_6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9]);
    connect(slab_7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10]);
    connect(slab_8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11]);
    connect(wall_11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12]);
    connect(wall_12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[13]);
    connect(wall_13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[14]);
    connect(wall_14.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[15]);
    connect(slab_9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[16]);
    connect(slab_10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[17]);
    connect(slab_11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[18]);
    connect(slab_12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[19]);
    connect(slab_13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[20]);
    connect(slab_14.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[21]);
    connect(slab_15.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[22]);
    connect(slab_16.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[23]);
    connect(wall_16.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[24]);
    connect(slab_17.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[25]);
    connect(slab_18.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[26]);
    connect(slab_19.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[27]);
    connect(slab_20.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[28]);
    connect(wall_20.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[29]);
    connect(slab_21.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[30]);
    connect(slab_22.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[31]);
    connect(slab_23.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[32]);
    connect(slab_24.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[33]);
    connect(slab_25.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[34]);
    connect(slab_26.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[35]);
    connect(slab_27.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[36]);
    connect(slab_28.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[37]);
    connect(slab_29.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[38]);
    connect(slab_30.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[39]);
    connect(slab_31.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[40]);
    connect(slab_32.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[41]);
    // connections between construction elements and ground
  // Heating set temperature of each thermal zones
    connect(zone_1.T_setHeating, T_setHeating[1]);
    connect(zone_2.T_setHeating, T_setHeating[2]);
    connect(zone_3.T_setHeating, T_setHeating[3]);
    connect(zone_4.T_setHeating, T_setHeating[4]);
    connect(zone_5.T_setHeating, T_setHeating[5]);
    connect(zone_6.T_setHeating, T_setHeating[6]);
    connect(zone_7.T_setHeating, T_setHeating[7]);
  // Cooling set temperatures of each thermal zones
    connect(zone_1.T_setCooling, T_setCooling[1]);
    connect(zone_2.T_setCooling, T_setCooling[2]);
    connect(zone_3.T_setCooling, T_setCooling[3]);
    connect(zone_4.T_setCooling, T_setCooling[4]);
    connect(zone_5.T_setCooling, T_setCooling[5]);
    connect(zone_6.T_setCooling, T_setCooling[6]);
    connect(zone_7.T_setCooling, T_setCooling[7]);
  // airchange rates of each thermal zones
    connect(zone_1.airchange, airchange[1]);
    connect(zone_2.airchange, airchange[2]);
    connect(zone_3.airchange, airchange[3]);
    connect(zone_4.airchange, airchange[4]);
    connect(zone_5.airchange, airchange[5]);
    connect(zone_6.airchange, airchange[6]);
    connect(zone_7.airchange, airchange[7]);
  // ambient temperature of each thermal zones
    connect(zone_1.TAirAmb, TAirAmb);
    connect(zone_2.TAirAmb, TAirAmb);
    connect(zone_3.TAirAmb, TAirAmb);
    connect(zone_4.TAirAmb, TAirAmb);
    connect(zone_5.TAirAmb, TAirAmb);
    connect(zone_6.TAirAmb, TAirAmb);
    connect(zone_7.TAirAmb, TAirAmb);
  // ambient moisture of each thermal zones
    connect(zone_1.xAirAmb, xAirAmb);
    connect(zone_2.xAirAmb, xAirAmb);
    connect(zone_3.xAirAmb, xAirAmb);
    connect(zone_4.xAirAmb, xAirAmb);
    connect(zone_5.xAirAmb, xAirAmb);
    connect(zone_6.xAirAmb, xAirAmb);
    connect(zone_7.xAirAmb, xAirAmb);
  // Cooling load of each thermal zones
    connect(zone_1.Q_flow_cooling, Q_flow_cooling[1]);
    connect(zone_2.Q_flow_cooling, Q_flow_cooling[2]);
    connect(zone_3.Q_flow_cooling, Q_flow_cooling[3]);
    connect(zone_4.Q_flow_cooling, Q_flow_cooling[4]);
    connect(zone_5.Q_flow_cooling, Q_flow_cooling[5]);
    connect(zone_6.Q_flow_cooling, Q_flow_cooling[6]);
    connect(zone_7.Q_flow_cooling, Q_flow_cooling[7]);
  // Heating load of each thermal zones
    connect(zone_1.Q_flow_heating, Q_flow_heating[1]);
    connect(zone_2.Q_flow_heating, Q_flow_heating[2]);
    connect(zone_3.Q_flow_heating, Q_flow_heating[3]);
    connect(zone_4.Q_flow_heating, Q_flow_heating[4]);
    connect(zone_5.Q_flow_heating, Q_flow_heating[5]);
    connect(zone_6.Q_flow_heating, Q_flow_heating[6]);
    connect(zone_7.Q_flow_heating, Q_flow_heating[7]);
  // Radiative heating source of each thermal zones
    connect(zone_1.radHeatSourcesPorts[1], radHeatSourcesPorts[1]);
    connect(zone_2.radHeatSourcesPorts[1], radHeatSourcesPorts[2]);
    connect(zone_3.radHeatSourcesPorts[1], radHeatSourcesPorts[3]);
    connect(zone_4.radHeatSourcesPorts[1], radHeatSourcesPorts[4]);
    connect(zone_5.radHeatSourcesPorts[1], radHeatSourcesPorts[5]);
    connect(zone_6.radHeatSourcesPorts[1], radHeatSourcesPorts[6]);
    connect(zone_7.radHeatSourcesPorts[1], radHeatSourcesPorts[7]);
  // Convective heating source of each thermal zones
    connect(zone_1.conHeatSourcesPorts[1], conHeatSourcesPorts[1]);
    connect(zone_2.conHeatSourcesPorts[1], conHeatSourcesPorts[2]);
    connect(zone_3.conHeatSourcesPorts[1], conHeatSourcesPorts[3]);
    connect(zone_4.conHeatSourcesPorts[1], conHeatSourcesPorts[4]);
    connect(zone_5.conHeatSourcesPorts[1], conHeatSourcesPorts[5]);
    connect(zone_6.conHeatSourcesPorts[1], conHeatSourcesPorts[6]);
    connect(zone_7.conHeatSourcesPorts[1], conHeatSourcesPorts[7]);
  end Building;

  Building building(
    nZones = 7)
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
    // Cooling set temperature of each thermal zones
    Modelica.Blocks.Sources.Constant TSetCooling_zone_1(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_2(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_3(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_4(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_5(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_6(k=273.15 + 24.0);
    Modelica.Blocks.Sources.Constant TSetCooling_zone_7(k=273.15 + 24.0);
    // Air change rate of each thermal zones
    Modelica.Blocks.Sources.Constant airchange_zone_1(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_2(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_3(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_4(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_5(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_6(k=0.5);
    Modelica.Blocks.Sources.Constant airchange_zone_7(k=0.5);
    // Heating source of each thermal zones
    Modelica.Blocks.Sources.Constant heatsources_zone_1(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_2(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_3(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_4(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_5(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_6(k=0.0);
    Modelica.Blocks.Sources.Constant heatsources_zone_7(k=0.0);
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatFlow[7];
    BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relationRadiationConvection[7](each radiationportion = 0.5);
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
    // Cooling set temperature of each thermal zones
    connect(TSetCooling_zone_1.y, building.T_setCooling[1]);
    connect(TSetCooling_zone_2.y, building.T_setCooling[2]);
    connect(TSetCooling_zone_3.y, building.T_setCooling[3]);
    connect(TSetCooling_zone_4.y, building.T_setCooling[4]);
    connect(TSetCooling_zone_5.y, building.T_setCooling[5]);
    connect(TSetCooling_zone_6.y, building.T_setCooling[6]);
    connect(TSetCooling_zone_7.y, building.T_setCooling[7]);
    // Air change rate of each thermal zones
    connect(airchange_zone_1.y, building.airchange[1]);
    connect(airchange_zone_2.y, building.airchange[2]);
    connect(airchange_zone_3.y, building.airchange[3]);
    connect(airchange_zone_4.y, building.airchange[4]);
    connect(airchange_zone_5.y, building.airchange[5]);
    connect(airchange_zone_6.y, building.airchange[6]);
    connect(airchange_zone_7.y, building.airchange[7]);
    // Heating source of each thermal zones
    connect(heatsources_zone_1.y, heatFlow[1].Q_flow);
    connect(heatsources_zone_2.y, heatFlow[2].Q_flow);
    connect(heatsources_zone_3.y, heatFlow[3].Q_flow);
    connect(heatsources_zone_4.y, heatFlow[4].Q_flow);
    connect(heatsources_zone_5.y, heatFlow[5].Q_flow);
    connect(heatsources_zone_6.y, heatFlow[6].Q_flow);
    connect(heatsources_zone_7.y, heatFlow[7].Q_flow);
    connect(relationRadiationConvection.heatPort, heatFlow.port);
    connect(relationRadiationConvection.heatPortCv, building.conHeatSourcesPorts[1:7]);
    connect(relationRadiationConvection.heatPortLw, building.radHeatSourcesPorts[1:7]);

  annotation(experiment(StartTime=0, StopTime=31536000, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));

  end RooftopBuilding3ZonesThin;
