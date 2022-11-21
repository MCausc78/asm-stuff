#!/bin/bash
./clean.sh
mkdir -pv bin/
nasm -felf64 libtestlib.asm
ld -shared -o ./bin/libtestlib.so libtestlib.o
sudo cp ./bin/libtestlib.so /usr/lib
gcc -o ./bin/prog -L. -Lbin prog.c -ltestlib

for d in ./programs/*
do
	echo "process '$d'"
	if [ -d "./$d" ]; then
		if [ -f "$d/build.sh" ]; then
			echo "build '$d'"
			cd ./$d
			./build.sh
			proj="$(basename $d)"
			cp "./$proj" ../../bin/.
			cd ../..
		else
			echo "build.sh does not exist in '$d'"
		fi
	else
		echo "'$d' is not a directory"
	fi
done
