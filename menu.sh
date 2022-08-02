#! /bin/bash

ARCHIVO=$1

# Verificando la velidez del input
[[ $# -ne 1 ]] && echo "Error: No se ingreso un unico argumento." && exit 1

! [[ -e $ARCHIVO ]] && echo "Error: Archivo no existente." && exit 2

! [[ -f $ARCHIVO ]] && echo "Error: No se ingreso un archivo valido." && exit 3

PS3="Elija la funcion que desee ejecutar: "
select ACCION in "SALIR" "Estadisticas de longitud de palabras." "Las 10 palabras mas repetidas." \
"Encontrar nombres propios." "Estadisticas de longitud de oraciones." "Cantidad de lineas en blanco." \ "Convertir minúsculas a mayúsculas y visceversa" "Reemplazar una palabra por otra" "Seleccionar oracion o parrafo" "Buscar palabras capicua.";
do
    [[ $REPLY -gt 10 || $REPLY -lt 1 ]] && echo "Opcion invalida" && continue
    [[ $REPLY == 1 ]] && echo "Terminando programa." && break
    [[ $REPLY == 2 ]] && ./statsWords.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 3 ]] && ./statsUsageWords.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 4 ]] && ./findNames.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 5 ]] && ./statsSentences.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 6 ]] && ./blankLinesCounter.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 7 ]] && ./caseConverter.sh $ARCHIVO && continue # ANDA
    [[ $REPLY == 8 ]] && echo "Donde la palabra sea: " ; read palabra1 && echo "Reemplazala con: " ; read palabra2 && ./substringReplace.sh $ARCHIVO $palabra1 $palabra2 && continue # ANDA
    [[ $REPLY == 9 ]] && echo "Ingrese 'P' u 'O'" ; read formato && echo "Ingrese un numero: " ; read numero && ./blockSelection.sh $ARCHIVO $formato $numero && continue # ANDA
    [[ $REPLY == 10 ]] && ./palindromeDetection.sh $ARCHIVO && continue
done