#!/bin/bash
# ./clean.sh
# mkdir -pv bin/
# nasm -felf64 libtestlib.asm
# ld -shared -o ./bin/libtestlib.so libtestlib.o
# sudo cp ./bin/libtestlib.so /usr/lib
# gcc -o ./bin/prog -L. -Lbin prog.c -ltestlib
./clean.sh
./clean-all.sh
mkdir -pv bin/
./build-all.sh
