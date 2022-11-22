#!/bin/bash
cd library
bash ./clean.sh
cd ../program
bash ./clean.sh
cd ..
rm -frv bin/