#!/bin/bash

for d in ./programs/*
do
	echo "process '$d'"
	if [ -d "$d" ]; then
		if [ -f "$d/clean.sh" ]; then
			echo "clean '$d'"
			cd $d
			./clean.sh
			cd ../..
		else
			echo "clean.sh does not exist in '$d'"
		fi
	else
		echo "'$d' is not a directory"
	fi
done
