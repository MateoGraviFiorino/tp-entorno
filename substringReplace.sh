#!/bin/bash

TEXTO=$(cat $1)

ARGUMENTO1=$2
ARGUMENTO2=$3

TEXTO_ARREGLADO=$(echo "$TEXTO" | sed 'y/áÁéÉíÍóÓúÚñÑ/aAeEiIoOuUnN/')

RES=$(echo "$TEXTO_ARREGLADO" | sed /baz/!s/"$ARGUMENTO1"/"$ARGUMENTO2"/g)

echo "$RES"
