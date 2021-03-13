#!/bin/bash

while getopts w:n: flag
do
        case "${flag}" in
                w) wnum=${OPTARG};;
		n) nnum=${OPTARG};;
                *) echo "Not enough arguments!"; exit 1;;
        esac
done

if [[ ! $wnum =~ ^[0-1][0-9]$ ]]
then
        echo "Bad week number ($wnum)!"; exit 1;
fi

# Here I should've checked if the number already exists but I am just way too tired to do that lel
echo $nnum
i=1
while [ $i -le ${nnum} ]
do
	newnum=$(((($RANDOM % 10)) + 1))
	friend=$(sed -n "${newnum}p" friendlist.txt)
	echo $friend
	echo "ZCZC W$wnum $friend" >> "../TXT/myrank.txt"
	i=$((i + 1))
done
