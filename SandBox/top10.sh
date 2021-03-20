#!/bin/bash

while getopts w: flag
do
	case "${flag}" in 
		w) wnum=${OPTARG};;
		*) echo "No week number given!"; exit 1;;
	esac
done

if [[ ! $wnum =~ ^[0-1][0-9]$ ]]
then
	echo "Bad week number ($wnum)!"; exit 1;
fi

cp w_template.md "../w${wnum}.md"
sed --quiet "s/XX/${wnum}/" "../w${wnum}.md"
# echo -e "---\npermalink: /W$wnum/\n---\n\n# Top 10 List of Week $wnum\nDisclaimer: This list is of no particular orderning, neither of importance nor chronological. It is written in the order in which I remembered them as I was writing this." > "../W$wnum.md"

echo "[W$wnum](https://bltszr.github.io/os211/W$wnum)" >> "../README.md"
