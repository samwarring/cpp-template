# cpp_template

<!-- begin new description -->
This repo is a starting point for cross-platform C++ projects.

## Features:
1. Supports Windows and Linux build environments.
1. CMake build system (requires version 3.21 or greater)
1. CMakePresets.json to record different CMake configurations.
1. vcpkg.json to automatically fetch and install dependent libraries on Windows (default triplet is x64-windows).
1. Track apt packages required for building in a file.

## Adapting the Template
This will update all files in the repo to use your new project name and stage the changes to git (Requires CMake).
```
cmake -DNEW_NAME=<new project name> -DNEW_DESC="<new description>" -P adapt_template.cmake
```
<!-- end new description -->

## Building on Debian Linux
### Environment Setup
1. Install latest CMake. There are 2 ways to do this:
    1. Add [Kitware's APT repository](https://apt.kitware.com/) to your APT sources, then `sudo apt install cmake` (recommended)
    1. Download Linux binaries from the [CMake website](https://cmake.org/download/). 
1. Install packages listed in `apt-build-depends.txt`
### Building
```
cd path/to/repo
cmake --preset ninja-multi
cmake --build --preset ninja-multi-debug
cmake --build --preset ninja-multi-release
ctest --preset ninja-multi-debug
ctest --preset ninja-multi-release
```

## Building on Windows
### Environment Setup
1. Install latest CMake from the [CMake website](https://cmake.org/download/).
1. Install [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/).
1. Clone the [vcpkg](https://github.com/Microsoft/vcpkg) repository.
1. Run `bootstrap-vcpkg.bat` from vcpkg repository root.
1. Set environment variable `VCPKG_ROOT` to vcpkg repository root.
### Building
```
cd path\to\repo
cmake --preset vs2022
cmake --build --preset vs2022-debug
cmake --build --preset vs2022-release
ctest --preset vs2022-debug
ctest --preset vs2022-release
```
