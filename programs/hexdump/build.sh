#!/bin/bash
# gcc -o hexdump hexdump.c
export CC=gcc
export CCFLAGS=-I.
export LD=gcc
export LDFLAGS=
export OUTPUT=hexdump
../bt/bt
