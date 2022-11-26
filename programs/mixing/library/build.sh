#!/bin/bash
export AS=nasm
export ASFLAGS=-felf64
export LD=gcc
export LDFLAGS='-shared -fPIC'
export OUTPUT=libmixtest.so

../../bt/bt build
sudo cp -frv ./bin/libmixtest.so /usr/lib
cp -frv bin/* ../../../bin
