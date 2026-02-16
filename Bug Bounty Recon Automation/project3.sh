#!/bin/bash

target=$1

REDCOLOR="\e[31m"
GREENCOLOR="\e[32m"


if [ ! -d $target ]
then 
	mkdir $target 
fi 

cd $target 

echo -e "$REDCOLOR [+] Finding subdomains using sublister...."


python3 /home/aryan23/Aryan/subwalker/subwalker/tools/Sublist3r/sublist3r.py -d $target -t 25 -o subdomains.txt

echo -e "$REDCOLOR [+] Finding subdomains using Assetfinder...."

/home/aryan23/Aryan/subwalker/subwalker/tools/assetfinder/assetfinder -subs-only $target > subdomains.txt

echo -e "$REDCOLOR [+] Sorting and filtering outputs...."

cat subdomains.txt | sort | uniq > subdomains

echo -e "$REDCOLOR [+] Finding live subdomains with httprobe...."

cat subdomains | httprobe > alive.txt

echo -e "$REDCOLOR [+] Finding JS file....s"

cat alive.txt | subjs > jsfiles

echo -e "$REDCOLOR [+] Finding subdomains takeovers...."

subjack -w subdomains -c /usr/share/subjack/fingerprints.json -t 25 -ssl -o takeovers.txt 

echo -e "$REDCOLOR [+] Fuzzing for directories...."


source /usr/share/subjack/dirsearch/venv/bin/activate

while read -r line 
do 
	python3 /usr/share/subjack/dirsearch/dirsearch.py -u $line -w /home/aryan23/Downloads/common.txt -o dirsearch_$line.txt
done < alive.txt

echo -e "$GREENCOLOR [+] Done.."












