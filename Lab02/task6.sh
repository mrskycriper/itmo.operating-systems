#!/bin/bash

(
largestVIRT=0
largestVIRTPid=0
for i in $(ls /proc | grep "[0-9]")
do
buffer=$(awk '$1 == "VmSize:" {print $2}' /proc/$i/status)
if [[ "$buffer" -gt "$largestVIRT" ]]
then 
largestVIRT=$buffer
largestVIRTPid=$(awk '$1 == "Pid:" {print $2}' /proc/$i/status)
fi
done

echo "My: $largestVIRTPid : $largestVIRT"
top -o VIRT -b -n 1 | head -8 | tail -1 | awk '{print ("Top: " $1 " : " $5)}') 2> /dev/null
