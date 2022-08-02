#!/bin/bash

FILE=$1
BLOCK=$2
SELECT=$3

#Validación de argumentos
[[ ! "$BLOCK" =~ [PpOo] ]] && echo "Bloque incorrecto. Ingrese P (párrafo) ׀ O (oración)" && exit 1
[[ ! "$SELECT" =~ [0-9]+ ]] && echo "Número de párrafo/oración inválido" && exit 1


FIN_OR="[.!?]+[\s]+?[\n]+?"


# Párrafos:
if [[ "$BLOCK" =~ [Pp] ]]; then
    # Leo la cantidad de párrafos
    LONG=$(awk -v RS=$FIN_PAR 'END { print NR }' $FILE)

    # Verifico que el párrafo solicitado exista
    if [ $SELECT -le $LONG ]; then
        # Imprimo la línea especificádola con NR
        awk -v RS=$FIN_PAR "NR==$SELECT" $FILE
    else
        echo "El archivo contiene $LONG párrafos"
        exit 1
    fi
fi

# Oraciones
if [[ "$BLOCK" =~ [Oo] ]]; then
           # Leo la cantidad de oraciones. Resto 1 porque considera el EOF como otro record.
    LONG=$(($(awk -v RS=$FIN_OR 'END { print NR }' $FILE)-1))

        # Verifico que la oración solicitada exista
        if [ $SELECT -le $LONG ]; then
                # Imprimo la oración especificádola con NR
                awk -v RS=$FIN_OR "NR==$SELECT" $FILE
        else
                echo "El archivo contiene $LONG oraciones"
                exit 1
        fi
fi

exit 0