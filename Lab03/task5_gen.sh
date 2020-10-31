#!/bin/bash

while true;
do
	read LINE
	echo "$LINE" > task5_pipe

	if [[ "$LINE" == "QUIT" ]];
	then 
		echo "Quiting"
		exit 0
	fi

	if [[ "$LINE" != [0-9]* && "$LINE" != "+" && "$LINE" != "*" ]];
	then
		echo "Wrong input data"
		exit 1
	fi
done
