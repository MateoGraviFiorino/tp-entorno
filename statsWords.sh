#!/bin/bash

#Indicador estadístico de longitud de palabras (la más corta, la más larga y el
#promedio de longitud).


estadisticasDePalabras(){
    TEXTO=$1
    MAS_LARGA=""
    MAS_CORTA="MESSI"
    CONTADOR=0

    for PALABRA in $TEXTO; do
        if [ ${#PALABRA} -gt ${#MAS_LARGA} ]; then
            MAS_LARGA=$PALABRA
        fi
        if [ ${#PALABRA} -lt ${#MAS_CORTA} ] ; then
            MAS_CORTA=$PALABRA
        fi

        CONTADOR=$(($CONTADOR + 1))

    done

    PROMEDIO=$((${#TEXTO} / $CONTADOR))

    echo "La palabra mas larga del texto es: $MAS_LARGA"
    echo "La palabra mas corta del texto es: $MAS_CORTA"
    echo "La cantidad de caracteres por palabra en promedio es: $PROMEDIO"

}

estadisticasDePalabras

