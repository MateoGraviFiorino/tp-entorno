#!/bin/bash

#Se realiza con un filtro grep, el -v selecciona los non-matching lines.
RESULTADO=$( grep -v '\S' $1 | grep -v '\a' | wc -l)

echo "La cantidad de lineas en blanco es de: $RESULTADO"
