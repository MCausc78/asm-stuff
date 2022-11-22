#!/bin/bash

export AS=nasm
export ASFLAGS=-felf64
export LD=gcc
export LDFLAGS=
export OUTPUT=ghoul

../bt/bt build
