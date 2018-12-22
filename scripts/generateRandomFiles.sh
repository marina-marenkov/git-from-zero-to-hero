#!/bin/bash
echo -en "\e[0;36mHow many files to generate: [3]:\e[0;33m"
read numberOfFiles
if [ -z "$numberOfFiles" ];
then
    numberOfFiles=3
fi
typeset -i numberOfFiles

if [ "$numberOfFiles" -lt 1 ];
then
    echo "Please set number greater then 0"
    exit
fi

echo -en "\e[0;36mType the file name that you want to use: [random]:\e[0;33m"
read fileName
if [ -z "$fileName" ]; 
then 
    fileName='random'
fi

echo -en "\e[0;36mType the file extention that you want to use: [txt]:\e[0;33m"
read fileExtention
if [ -z "$fileExtention" ];   
then 
    fileExtention='txt'
fi


for (( filenumber = 1; filenumber <= $numberOfFiles ; filenumber++ )); 
do
    echo "Some new random text: $RANDOM" >> $fileName$filenumber.$fileExtention
    git add $fileName$filenumber.$fileExtention
    git commit -m"A random change of $RANDOM to $fileName$filenumber.$fileExtention"
done


