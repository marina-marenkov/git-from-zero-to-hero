#!/bin/sh

grep "Here is the bug" random3.txt

# The "good" and "bad" are based upon our bisect definition
if [ "$?" -eq "0" ]; 
then
    echo "Text found."
    exit 1
else
    echo "Text not found."
    exit 0
fi