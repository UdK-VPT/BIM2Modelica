BIM2Modelica
============
This Repository contains an open source toolchain which generates Modelica building models from BIM models based on the IFC format.
It uses the GUI and the software infrastructure of CoTeTo for simplifying the code generation process.

## CoTeTo

The template based code generation tool [CoTeTo](https://github.com/UdK-VPT/CoTeTo.git) is used
as the software framework for the entire tool chain from the IFC file to the Modelica building model.
All the intermediate steps from

* reading and checking an IFC file,
* storing the building data in a data structure up to
* generating a building model based on a [Mako](https://www.makotemplates.org) template

is summarized in one CoTeTo code generator (a short introduction into the generator package concept of CoTeTo you can find under [CoTeTo/Generators/README.md](https://github.com/UdK-VPT/CoTeTo/tree/master/Generators)).

At the moment one code generator for [multi-zone building models](https://github.com/UdK-VPT/BIM2Modelica/tree/master/CoTeTo_Generators/IFC_MultiZoneBuildings_Modelica)
which can read the IFC 2X3 format and generates code for the Modelica BuildingSystems [BuildingSystems](http://www.modelica-buildingsystems.de) libray is realized.

## IFC data reader and model checker

## Template for Modelica code generation

## IFC test models

## Generated Modelica building models
