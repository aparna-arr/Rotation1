#!/bin/bash

file=$1

if [ $# -lt 1 ]
then
	echo "usage: <peak calling metadata file>"
	exit 1
fi 

while read line
do	
	read -a lineAr <<< "$line"

	if [ "${lineAr[0]}" == "file" ]
	then 
		continue
	fi

	echo "On ${lineAr[0]}"

	if [ "${lineAr[5]}" == "." ] 
	then
		echo "macs2 callpeak -t ${lineAr[0]} -n ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} --outdir ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} -f BAM -g hs --verbose 0" >> cmd
#		echo "sleep ${lineAr[0]}" && sleep 10 && echo "done! ${lineAr[0]}" &
		 
	else
		echo "macs2 callpeak -t ${lineAr[0]} -c ${lineAr[5]} -n ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} --outdir ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} -f BAM -g hs --verbose 0" >> cmd
#		echo "sleep ${lineAr[0]}" && sleep 10 && echo "done! ${lineAr[0]}" &
	
	fi

#	for field in "${lineAr[@]}"
#	do
#		echo "[$field]"
#	done


done < $file

wait

