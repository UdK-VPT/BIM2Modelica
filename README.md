BIM2Modelica
============
This Repository contains an open source toolchain which generates Modelica building models from BIM models based on the IFC format.
It uses the GUI and the software infrastructure of CoTeTo for simplifying the code generation process.

## License
The BIM2Modelica software package is available under the terms of the BSD 3-Clause License.
A copy of the license is available at
[BIM2Modelica/LICENSE.md](https://github.com/UdK-VPT/BIM2Modelica/blob/master/LICENSE.md).

## CoTeTo

The template based code generation tool [CoTeTo](https://github.com/UdK-VPT/CoTeTo.git) is used
as the software framework for the entire tool chain from the IFC file to the Modelica building model.
All the intermediate steps from

* reading and checking an IFC file,
* storing the building data in a data structure up to
* generating a building model based on a [Mako](https://www.makotemplates.org) template

is summarized in one CoTeTo code generator (a short introduction into the generator package concept of CoTeTo you can find under [CoTeTo/Generators/README.md](https://github.com/UdK-VPT/CoTeTo/tree/master/Generators)).

At the moment one code generator for [Modelica multi-zone building models](https://github.com/UdK-VPT/BIM2Modelica/tree/master/CoTeTo_Generators/IFC_MultiZoneBuildings_Modelica)
which can read the IFC 2X3 format and generates code for the Modelica BuildingSystems [BuildingSystem library](http://www.modelica-buildingsystems.de) is realized.

## IFC data reader and model analyser

This [software module](https://github.com/UdK-VPT/BIM2Modelica/tree/master/CoTeTo_Generators/IFC_MultiZoneBuildings_Modelica/Filters)
reads and analyses the IFC files for thermal simulation purposes.
Therefore, features of the Python package [IfcOpenShell](https://github.com/IfcOpenShell/IfcOpenShell.git)
and the Python package [OCC](https://github.com/tpaviot/pythonocc) are used.

## Template for Modelica code generation

A flexible Mako template for [Modelica multi-zone building models](https://github.com/UdK-VPT/BIM2Modelica/blob/master/CoTeTo_Generators/IFC_MultiZoneBuildings_Modelica/Templates/PhysicalModel.mot)
generates the Modelica code for thermal building models with a flexible geometry, number of zones, building constructions and boundary conditions (weather data, building use).

## IFC test models

A set of [IFC test models](https://github.com/UdK-VPT/BIM2Modelica/tree/master/IFC/IFC2X3) in the IFC2x3 format is part of the BIM2Modelica repository.

## Generated Modelica building models

[This folder](https://github.com/UdK-VPT/BIM2Modelica/tree/master/ModelicaModels/IFC2X3) includes the generated Modelica models correspondent to the IFC2X3 test models.

## Usage
1. Clone or download CoTeTo (https://github.com/UdK-VPT/CoTeTo.git)

2. Install CoTeTo on your machine.

3. Copy the folder with the respective code generator (https://github.com/UdK-VPT/BIM2Modelica/tree/master/CoTeTo_Generators/IFC_MultiZoneBuildings_Modelica) in the folder CoTeTo/Generators.

4. Start the GUI of CoTeTo and select the generator of your interest, in this case `IFC_MultiZoneBuildings_Modelica`.

![CoTeTo-GUI](https://github.com/UdK-VPT/BIM2Modelica/blob/master/docs/source/images/CoTeTo_GUI.png)

5. Select the IFC input file (e.g. BIM2Modelica/IFC/IFC2X3/UdKB_Test_Cases/[OneZone.ifc](https://github.com/UdK-VPT/BIM2Modelica/tree/master/IFC/IFC2X3/UdKB_Test_Cases/OneZone.ifc))

6. Name the output model name (e.g. OneZone) and press **Generate**.

7. As a result three files (OneZone.mo, OneZone_StateVariables.cs and OneZone_BuildingModel.cs) are generated.

6. Open the generated .mo-File in your Modelica simulation environment and simulate it.

For example, you can do this with the Open Source simulation tool JModelica
(as explained [here](https://github.com/UdK-VPT/BIM2Modelica/tree/master/ModelicaModels/Resources/Scripts/JModelica)):

![Simulation results](https://github.com/UdK-VPT/BIM2Modelica/blob/master/ModelicaModels/Resources/Images/IFC2X3/UdKB_Test_Cases/Results_OneZone.png)
