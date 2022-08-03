#!/bin/bash

TEXTO=$1

#COMPRUEBO SI EL ARCHIVO EXISTE

if [ -e $TEXTO ]
then
	tr '[:upper:][:lower:]' '[:lower:][:upper:]' < $TEXTO > output.txt
else
	echo "Archivo inexistente"
fi
# si el archivo existe, con tr cambio las mayusculas por minusculas
# y minusculas por mayusculas

cat output.txt
rm output.txt
