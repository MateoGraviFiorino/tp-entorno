#!/bin/bash

ARCHIVO=$1

SOLO_PALABRAS="^[A-Za-z]+$"    #regex para filtrar solo palabras

MAYOR_PAL=0
MENOR_PAL=0
CONT_PAL=0
SUMA_CARACTERES=0

while read linea; do
    for palabra in $linea; do
    #recorremos con un while el texto
        if [[ $palabra =~ $SOLO_PALABRAS ]]; then
        if [ $CONT_PAL == 0 ]; then
            MAYOR_PAL=$palabra
            MENOR_PAL=$palabra
        else
        #Si no es la primera palabra la comparo con las palabras guardadas
            [ ${#palabra} -gt ${#MAYOR_PAL} ] && MAYOR_PAL=$palabra
            [ ${#palabra} -lt ${#MENOR_PAL} ] && MENOR_PAL=$palabra
        fi

        ((CONT_PAL++))            #incrementa contador
        SUMA_CARACTERES=$((SUMA_CARACTERES+${#palabra}))
    fi
    done
done <$ARCHIVO

#calcular promedios
PROMEDIO=$((SUMA_CARACTERES/CONT_PAL))

echo "Palabra mas larga: $MAYOR_PAL - ${#MAYOR_PAL} letras"

([ ${#MENOR_PAL} -eq 1 ] && echo "Palabra mas corta: $MENOR_PAL - ${#MENOR_PAL} letra") || echo "Palabra mas corta: $MENOR_PAL - ${#MENOR_PAL} letras" 
echo "Promedio de longitud de palabras: $PROMEDIO letras"

exit 0

