#!/bin/bash

if [ -e src -a -e "configure" -a -e "arcanist" -a -e "src/qt" -a -e ".git" ]; then
	echo Removing all in build/ and depends/out* ...
	rm -fr build/ depends/out*
	echo Done.
else
	echo Wrong dir
	exit 1
fi

