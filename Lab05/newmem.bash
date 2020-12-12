#!/bin/bash

array_index=0
array=()

while true
do
  	for (( count=0; count<10; count++ ))
        do
          	array[$array_index]=$count
                array_index=$((array_index+1))
        done

	if [[ "$1" -lt "${#array[*]}" ]]
        then
            	echo "STOP"
                break
        fi
done

exit 0
