#!/bin/bash

export AS=nasm
export ASFLAGS=-felf64
export LD=gcc
export LDFLAGS=-shared
export OUTPUT=libcwa.so

../bt/bt build
