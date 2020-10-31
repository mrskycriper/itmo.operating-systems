#!/bin/bash

echo $$ > .pid
number=1
curr_operation=""

EXIT()
{
	echo "Exiting"
	exit 0
}

PLUS()
{
	curr_operation="+"
}

MULTI()
{
	curr_operation="*"
}

trap 'EXIT' SIGTERM
trap 'PLUS' USR1
trap 'MULTI' USR2

while true;
do
	case "$curr_operation" in
		"+")
			number=$((number + 2))
		;;
		"*")
			number=$((number * 2))
		;;
	esac
	echo $number
	sleep 1
done
