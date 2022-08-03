#!/bin/bash

TEXTO=$1

CAT=$(cat $TEXTO)

CONT_ORACIONES=$((0))
SUMA_LONGITUDES=$((0))

newIFS=$IFS #el IFS es un separador de campo de entrada o delimitadores de palabras.
IFS=$'.\n'

for i in $CAT
do
	CONT_ORACIONES=$((CONT_ORACIONES+1))
	LONGITUD=${#i}
	SUMA_LONGITUDES=$((SUMA_LONGITUDES+LONGITUD))

	echo -e "$LONGITUD - '$i'\n" >> ordenar.txt

done


IFS=$newIFS
unset newIFS

#--------- TOTAL DE LINEAS -----------

LINEAS=$((0))

newIFS=$IFS
IFS=$'\n'

for i in $(cat ordenar.txt)
do
	LINEAS=$((LINEAS+1))
done

IFS=$newIFS
unset newIFS


ORDENADA=$(cat ordenar.txt | sort -g) # el sort -g compara de acuerdo a un valor general

#---------- MAS LARGA Y MAS CORTA --------
N=$((1))

newIFS=$IFS
IFS=$'\n'

for i in $ORDENADA
do
	if [ $N -eq 1 ]
	then
		N=$((N+1))
		echo -e "La mas corta: $i \n"
	elif [ $N -eq $LINEAS ]
	then
		echo -e "La mas larga: $i \n"
	else
		N=$((N+1))

	fi
done

IFS=$newIFS
unset newIFS

#------------ PROMEDIO ------------------

PROMEDIO=$(($SUMA_LONGITUDES/$CONT_ORACIONES))

echo "El promedio de longitudes es igual a $PROMEDIO"

rm ordenar.txt
