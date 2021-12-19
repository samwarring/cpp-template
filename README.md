# cpp-template

This repo is a starting point for cross-platform C++ projects.

## Features:
1. CMake build system (requires version 3.21 or greater)
1. CMakePresets.json to record different CMake configurations.
1. vcpkg.json to automatically fetch and install dependent libraries on Windows (default triplet is x64-windows).

## Building on Windows
### Command line
```
$ cd path\to\repo
$ cmake --preset vs2022
$ cmake --build --preset vs2022-debug
$ cmake --build --preset vs2022-release
$ ctest --preset vs2022-debug
$ ctest --preset vs2022-release
```
