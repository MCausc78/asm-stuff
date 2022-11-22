#!/bin/bash

export CC=gcc
export CCFLAGS=
export LD=gcc
export LDFLAGS='-L. -lmixtest'
export OUTPUT=program

../../bt/bt build

cp -frv bin/* ../../../bin