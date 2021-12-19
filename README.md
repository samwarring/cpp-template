# cpp-template

This repo is a starting point for cross-platform C++ projects.

## Features:
1. Supports Windows and Linux build environments.
1. CMake build system (requires version 3.21 or greater)
1. CMakePresets.json to record different CMake configurations.
1. vcpkg.json to automatically fetch and install dependent libraries on Windows (default triplet is x64-windows).
1. Track apt packages required for building in a file.

## Building on Debian Linux
```
cd path/to/repo
sudo apt update
sudo apt install `cat apt-build-depends.txt`
cmake --preset ninja-multi
cmake --build --preset ninja-multi-debug
cmake --build --preset ninja-multi-release
ctest --preset ninja-multi-debug
ctest --preset ninja-multi-release
```

## Building on Windows
```
cd path\to\repo
cmake --preset vs2022
cmake --build --preset vs2022-debug
cmake --build --preset vs2022-release
ctest --preset vs2022-debug
ctest --preset vs2022-release
```
