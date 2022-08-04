#!/bin/bash

TEXTO=$(cat $1)
#recorremos el texto con un bucle for
#si la palabra es igual a la palabra(despues de aplicarle el rev) es un palindromo

for palabra in $TEXTO;
do
	PALABRA_ARREGLADA=$(echo $palabra | tr '[:upper:]' '[:lower:]')
	REV=$(echo $palabra | rev)
	if [ $PALABRA_ARREGLADA = $REV ]
	then
		echo $palabra
	fi
done

