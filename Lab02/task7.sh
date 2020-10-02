#!/bin/bash

declare -A startBytes

for i in $(ps aux | tail -n+2 | awk '{print $2}');
do
buffer=$(cat "/proc/$i/io" | grep read_bytes | awk '{print $2}')
startBytes[$i]=$buffer
done 2> /dev/null

sleep 1m

declare -A finishBytes

for i in $(ps aux | tail -n+2 | awk '{print $2}');
do
buffer=$(cat "/proc/$i/io" | grep read_bytes | awk '{print $2}')
finishBytes[$i]=$buffer
done 2> /dev/null

for i in ${!finishBytes[@]};
do
start=${startBytes[$i]}
finish=${finishBytes[$i]}

if [[ "$start" == "" ]]
then start=0
fi

let 'difference=finish-start'
echo "$difference $i"
done 1> tmp


#cat tmp 2> /dev/null
cat tmp | sort -n | tail -n 3 | awk '{
cmd="ps ax | grep "$2" | awk \47{print $5}\47"
cmd | getline ex_line
printf "%s:%s:%s\n", $2, ex_line, $1
}'


rm tmp
