#!/bin/bash

curr_operation="+"
variable=1

(tail -f task5_pipe) |
while true;
do
	read LINE

	#echo $LINE

	case "$LINE" in
		"+")
			curr_operation="$LINE"
			echo "Plus"
		;;
		"*")
			curr_operation="*"
			echo "Multi"
		;;
		[0-9]*)
			case $curr_operation in
				"+")
					result=$(($variable + $LINE))
					echo "$result"
				;;
				"*")
					result=$(($variable * $LINE))
					echo "$result"
				;;
			esac
		;;
		"QUIT")
			killall tail
			exit 0
		;;
		*)
			killall tail
			exit 1
		;;
	esac
done
