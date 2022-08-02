#! /bin/bash

ARCHIVO=$1

# Filtramos las palabras por aquellas que comienzen por una letra mayuscula
# seguida de una o mas letras minusculas
for PALABRA in $(cat $ARCHIVO | grep -oE "\w+" | grep -oE "^[A-Z][a-z]+$")
do
    echo $PALABRA
done