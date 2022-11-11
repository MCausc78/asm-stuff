#!/bin/bash

nasm -felf64 libtestlib.asm
ld -shared -o libtestlib.so libtestlib.o

sudo cp libtestlib.so /usr/lib

gcc -o prog -L. prog.c -ltestlib
