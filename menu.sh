#! /bin/bash

ARCHIVO=$1

# Verificando la velidez del input
[[ $# -ne 1 ]] && echo "INGRESE UN SOLO ARGUMENTO..." && exit 1

! [[ -e $ARCHIVO ]] && echo "ESE ARCHIVO NO EXISTE..." && exit 2

! [[ -f $ARCHIVO ]] && echo "EL ARCHIVO NO ES VÁLIDO..." && exit 3

PS3="Elija el filtro que desee aplicar: "
select ACCION in "SALIR" "Estadisticas de longitud de palabras." "Las 10 palabras mas repetidas." \
"Encontrar nombres propios." "Estadisticas de longitud de oraciones." "Cantidad de lineas en blanco." \ "Convertir minúsculas a mayúsculas y visceversa" "Reemplazar una palabra por otra" "Seleccionar oracion o parrafo" "Buscar palabras capicua.";
do
    [[ $REPLY -gt 10 || $REPLY -lt 1 ]] && echo "Opcion invalida" && continue
    [[ $REPLY == 1 ]] && echo "Gracias por usar el programa :) " && break
    [[ $REPLY == 2 ]] && bash statsWords.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 3 ]] && bash statsUsageWords.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 4 ]] && bash findNames.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 5 ]] && bash statsSentences.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 6 ]] && bash blankLinesCounter.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 7 ]] && bash caseConverter.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 8 ]] && echo "Donde la palabra sea: " && read palabra1 && echo "Reemplazala con: " && read palabra2 && bash substringReplace.sh $ARCHIVO $palabra1 $palabra2 && continue # ANDA ESTA ANDA
    [[ $REPLY == 9 ]] && echo "Ingrese P u O" && read formato && echo "Ingrese un numero: " && read numero && bash blockSelection.sh $ARCHIVO $formato $numero && continue # ANDA
    [[ $REPLY == 10 ]] && bash palindromeDetection.sh $ARCHIVO && continue
done
