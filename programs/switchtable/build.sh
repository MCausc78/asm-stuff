#!/bin/bash

export AS=nasm
export ASFLAGS=-felf
export LD=ld

# ld require -melf_i386 on 64-bit, so we need to check
if [[ "$(uname -m)" == "x86_64" ]]; then
	export LDFLAGS=-melf_i386
else
	export LDFLAGS=
fi

export OUTPUT=switchtable

../bt/bt build
