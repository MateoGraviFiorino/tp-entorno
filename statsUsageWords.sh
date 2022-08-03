#!/bin/bash

ARCHIVO=$1

INDICE=0

# sort acomoda las palabras del texto para poder aplicar uniq -c, que cuenta las apariciones
# de las lineas
# luego aplicamos sort con el argumento -r, que revierte el orden del sort
# finalmente, aplicamos grep nuevamente para obtener todas las palabras en una lista

for PALABRA in $(cat $ARCHIVO | grep -oE "\w{4,}+" | sort | uniq -c | sort -r) #uniq -c es igual a --count
do
    INDICE=$(($INDICE + 1))
    if [[ $(($INDICE % 2)) -eq 0 ]]
    then
        echo $PALABRA
    else
        echo -n "$(($INDICE / 2 + 1)). Con $PALABRA repeticion(es): "
    fi
    [[ INDICE -eq 20 ]] && break 
done
