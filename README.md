# Real-Time Time-Optimal Trajectory Parameterization

## Setup and build for users (tested on Ubuntu 26.04)

     sudo apt install libboost-all-dev libeigen3-dev libgtest-dev libbenchmark-dev ninja-build nlohmann-json3-dev
     git clone --recursive https://github.com/KITrobotics/rt-topp.git rttopp
     cd rttopp
     mkdir build && cd build
     cmake ../ -G Ninja -DCMAKE_BUILD_TYPE=Release
     ninja

## Additional steps for developers
     sudo apt install clang clang-format clang-tidy python3-matplotlib python3-numpy pre-commit dvipng texlive-latex-extra texlive-fonts-recommended cm-super texlive-science
     python3 -m pre_commit install

## Examples
Files in `examples` contain some usage examples. They parametrize random paths.

`scripts` contains a script for plotting of generated trajectories.

## Tests
Tests can be run with `ctest --verbose` in the build directory.
