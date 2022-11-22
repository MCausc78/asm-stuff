#!/bin/bash
cd library
bash ./build.sh
cd ../program
bash ./build.sh
cd ..
# mkdir -pv bin
# cp -frv library/bin/**/** bin/.
# cp -frv program/bin/**/** bin/.