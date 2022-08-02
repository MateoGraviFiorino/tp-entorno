#!/bin/bash

TEXTO=$(cat $1)

for palabra in $TEXTO;
do
	PALABRACS=$(echo $palabra | tr '[:upper:]' '[:lower:]')
	REV=$(echo $palabra | rev)
	if [ $PALABRACS = $REV ]
	then
		echo $palabra
	fi
done

