#!/bin/bash

nasm -felf64 ghoul.asm
gcc -o ghoul ghoul.o