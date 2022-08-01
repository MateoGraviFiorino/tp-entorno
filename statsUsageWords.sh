#!/bin/bash

#filtrar por las que tienen al menos 4 letras

contador=0

for palabra in $(cat $1 | sort | uniq)
do
	if [ $contador -eq 0 ]
	then
	#filtro
		if [ ${#palabra} -ge 4 ]
		then
			for palabra2 in $(cat $1)
			do
				if [[ $palabra = $palabra2 ]]
				then
					contador=$((contador+1))
				else
					continue
				fi
			
				#echo "$contador - $palabra"			
			done
			echo "$contador apariciones: $palabra" >> statsUsageWords.txt
		fi
	else
		contador=0
	fi
done


echo "Top Ten de palabras con mas apariciones: "

cat statsUsageWords.txt | sort | uniq | sort -r | head --lines=10

rm statsUsageWords.txt
