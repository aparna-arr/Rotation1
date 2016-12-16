#!/bin/bash




file=peak_calling_metadata

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
		macs2 callpeak -t ${lineAr[0]} -n ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} --outdir ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} -f BAM -g hs 
		 
	else
		macs2 callpeak -t ${lineAr[0]} -c ${lineAr[5]} -n ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} --outdir ${lineAr[1]}_${lineAr[2]}_${lineAr[3]}_${lineAr[4]} -f BAM -g hs 
	
	fi


#	for field in "${lineAr[@]}"
#	do
#		echo "[$field]"
#	done

done < $file


