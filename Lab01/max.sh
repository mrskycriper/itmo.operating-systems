#!/bin/bash

buffer=0

if [[ "$1" -ge "$2" ]]
then buffer="$1"
else buffer="$2"
fi

if [[ "$3" -ge "$buffer" ]]
then echo "$3"
else echo "$buffer"
fi

exit 0
