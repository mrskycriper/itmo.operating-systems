#!/bin/bash

function createBackup {
	backup=$(echo "Backup-"$(date +"%Y-%m-%d"))
	mkdir ~/backup/$backup
	echo "Created: "$backup >> ~/backup-report

	for i in $(ls ~/source/)
	do
		cp ~/source/$i ~/backup/$backup/$i
		echo "Copied: " $i >> ~/backup-report
	done
}

trap="$(ls ~/source/)"

if [[ "$trap" != "${trap// /_}" ]]
then
	echo "Error, spaces are currently not supported"
	exit 1
fi

if [[ "$(tree ~/source/ | tail -1 | awk '{print $1}')" != 0 ]]
then
	echo "Error, folders are currently not supported"
	exit 1
fi

lastBackup=$(ls ~/backup | tail -1)


if [[ -z $lastBackup ]]

then
	createBackup
else
	file=$(echo "Backup-"$(date +"%Y-%m-%d"))

	date1=$(echo $lastBackup | awk -F "-" '{print $4}')
	date2=$(echo $file | awk -F "-" '{print $4}')
	delta=$(echo $date2"-"$date1 | bc)

	if [[ $delta -ge 7 ]]
	then
		createBackup
	else
	flag="0"

	touch buffer1
	touch buffer2

	for i in $(ls ~/source/)
	do
		find ~/backup/$lastBackup/$i 2> /dev/null > /dev/null

		if [[ $? == "1" ]]
		then
			if [[ $flag == "0" ]]
			then
				echo "Updated: "$lastBackup  $(date +"%Y-%m-%d") >> ~/backup-report
				flag="1"
			fi

			cp ~/source/$i ~/backup/$lastBackup/$i
			echo "Copied: " $i >> buffer1
		else
			size1=$(wc -c ~/backup/$lastBackup/$i | awk '{print $1}')
			size2=$(wc -c ~/source/$i | awk '{print $1}')

			if [[ $size1 -ne $size2 ]]
			then
				if [[ $flag == "0" ]]
				then
					echo "Updated: "$lastBackup  $(date +"%Y-%m-%d") >> ~/backup-report
					flag="1"
				fi
				mv ~/backup/$lastBackup/$i ~/backup/$lastBackup/$i"."$(echo $lastBackup | awk -F "-" '{print $2"-"$3"-"$4}')
				cp ~/source/$i ~/backup/$lastBackup/$i

				echo "Updated: "$i  $i"."$(echo $lastBackup | awk -F "-" '{print $2"-"$3"-"$4}') >> buffer2
				fi
			fi
		done

		cat buffer1 >> ~/backup-report
		cat buffer2 >> ~/backup-report
  		rm buffer1
		rm buffer2
	fi
fi
exit 0


