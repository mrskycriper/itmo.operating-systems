#!/bin/bash

while true;
do
	read LINE
	case "$LINE" in
		"TERM")
			kill -TERM $(cat .pid)
			exit 0
		;;
		"+")
			kill -USR1 $(cat .pid)
		;;
		"*")
			kill -USR2 $(cat .pid)
		;;
		*)
			:
		;;
	esac
done
