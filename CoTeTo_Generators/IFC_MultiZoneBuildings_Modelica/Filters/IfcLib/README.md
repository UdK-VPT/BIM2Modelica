# IFC

This folder contains a library which can import and analyze IFC data files
and stores the relevant information for building energy simulation
in a data structure which is defined in `IfcLib\DataClasses.py`.

# Dependencies
Note: Install everything as **64 bit**, because some larger IFC files require much RAM!  
For compilation, [Visual Studio 2017 Community](https://www.visualstudio.com/downloads) and [Cmake](https://cmake.org/download/) will be required.

1. Install [Anaconda](https://www.continuum.io/downloads "Anaconda") (latest Python 3.x recommended).  
  After installation, update it by running in the Anaconda Prompt:  
  `conda update conda`  
  `conda update anaconda`  
  `conda install future`  
  `conda update --all` (optional)

2. Install [pythonocc-core](https://github.com/tpaviot/pythonocc-core#how-to-quicky-downloadinstall-binaries-) using the Anaconda Prompt.
    * Add some additional [channels](https://conda.io/docs/channels.html) to make sure all packages can be found:  
      `conda config --append channels conda-forge`  
      `conda config --append channels DLR-SC`  
      `conda config --append channels pythonocc`  
      `conda config --append channels oce`  
    * Then install pythonocc-core:  
      `conda install pythonocc-core`  
    * Check whether installation succeeded:  
      `conda list`

3. Install IfcOpenShell by compiling from source code as described below (or in the [Windows ReadMe](https://github.com/IfcOpenShell/IfcOpenShell/tree/master/win) file).
    * Download or clone or pull the latest IfcOpenShell master from [GitHub](https://github.com/IfcOpenShell/IfcOpenShell).
    * Open the Visual Studio 2017 Developer Command Prompt,  
      and `cd` to the `win` directory.
    * If you have previously built the dependencies and you want to re-build them,  
      run `git clean -fdx` to remove all build artifacts.
    * Tell the build script we want to [use an existing Python](https://github.com/IfcOpenShell/IfcOpenShell/tree/master/win#using-an-already-existing-python-installation) by running:  
      `set IFCOS_INSTALL_PYTHON=FALSE`
    * Tell the build script whether you want to use the official OpenCascade:  
      `set IFCOS_USE_OCCT=TRUE`
    * Now build the dependencies by running:  
      `build-deps.cmd vs2017-x64`  
      Verify the configuration as shown in the prompt is correct before starting the build process,  
      as building the dependencies will take about half an hour.  
    * Tell the subsequent build scripts about the your Python version and Python home by running:  
      `echo PY_VER_MAJOR_MINOR=36>> BuildDepsCache-x64.txt`   
      `echo PYTHONHOME=%USERPROFILE%\Anaconda3>> BuildDepsCache-x64.txt`  
      or similar.
    * Generate the solution file for IfcOpenShell by running:  
      `run-cmake.bat vs2017-x64`
    * Build and install IfcOpenShell by running:  
      `install-ifcopenshell.bat`
    * Optional: Set the environment variable `CSF_GraphicShr` based on the installation directory of Python.  
      For example, on Windows and `Anaconda3` this could be: `CSF_GraphicShr ...\Anaconda3\Lib\site-packages\OCC\TKOpenGl.dll`
