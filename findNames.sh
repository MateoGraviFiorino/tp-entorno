#! /bin/bash

ARCHIVO=$1

for PALABRA in $(cat $ARCHIVO | grep -oE "\w+" | grep -oE "^[A-Z][a-z]+$") #grep -oE hace solo los onlymatching y E extended regular expresions
do
    echo $PALABRA
done
