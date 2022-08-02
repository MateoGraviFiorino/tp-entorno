#!/bin/bash

ARCHIVO=$1

INDEX=0

# grep filtra todas las palabras del archivo 4 o mas de largo.
# sort las acomoda para podes aplicar uniq -c, que cuenta las apariciones
# de las lineas (que ahora tiene cada una una palabra) iguales consecutivas
# luego aplicamos sort con el argumento -r, que revierte el orden del sort
# #finalmente, aplicamos grep nuevamente para obtener todas las palabras en una lista
# sin la cantidad de apariciones (que queda como residuo de uniq -c)
# para la fuente de este codigo, con ciertas modificaciones, visite el archivo README
for PALABRA in $(cat $ARCHIVO | grep -oE "\w{4,}+" | sort | uniq -c | sort -r)
do
    INDEX=$(($INDEX + 1))
    if [[ $(($INDEX % 2)) -eq 0 ]]
    then
        echo $PALABRA
    else
        echo -n "$(($INDEX / 2 + 1)). Con $PALABRA repeticion(es): "
    fi
    [[ INDEX -eq 20 ]] && break # Cuando hayamos leido las primer 10 palabras, dejamos de iterar.
done