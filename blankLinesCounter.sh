#!/bin/bash

#Contar lineas en blanco

RESULTADO=$(grep -cv -P '\S' $1)
echo $RESULTADO

