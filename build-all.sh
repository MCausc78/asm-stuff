#!/bin/bash
shopt -s globstar
for d in ./programs/*
do
	echo "process '$d'"
	if [ -d "./$d" ]; then
		if [ -f "$d/build.sh" ]; then
			echo "build '$d'"
			cd ./$d
			bash ./build.sh
			VT1="$(echo bin/**/*)"
			if [ "$VT1" != 'bin/**/*' ]; then
				CMD="cp -frv \"$VT1\" ../../bin/."
				echo "$CMD"
				eval "$CMD"
			fi
			cd ../..
		else
			echo "build.sh does not exist in '$d'"
		fi
	else
		echo "'$d' is not a directory"
	fi
done
