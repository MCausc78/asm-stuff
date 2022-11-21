#!/bin/bash

nasm -felf64 factorial.asm
gcc $@ -o factorial factorial.o