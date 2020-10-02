#!/bin/bash

read buffer

while [[ "$buffer" != "q" ]]
do result="$result$buffer"
read buffer
done

echo $result
exit 0
