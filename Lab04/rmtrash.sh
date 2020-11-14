#!/bin/bash

if [[ (-z "$1") || (-n "$2") ]]
then
	echo "Error, invalid arguments"
	exit 1
fi

(find "$1" 2> /dev/null > /dev/null) || (echo "Error, no such file found" ; exit 1)

input="${1// /_}"

#echo $input

(find ~/.trash 2> /dev/null > /dev/null) || (mkdir ~/.trash)

trashedFileName=$(tree ~/.trash | tail -1 | awk '{print ($3 + 1)}')

(ln "$1" ~/.trash/$trashedFileName 2> /dev/null) || (echo "Error, failed to create link" ; exit 1)

(rm "$1" 2> /dev/null) || (echo "Error, failed to remove the file" ; exit 1)

echo "$PWD/$input $trashedFileName" >> ~/.trash.log

exit 0
