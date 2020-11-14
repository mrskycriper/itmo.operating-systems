#!/bin/bash

backup=$(ls ~/backup | tail -1)

if [[ -z $backup ]]
then
	echo "Error, no backups found"
	exit 1
fi

awk -v file=$backup 'BEGIN{flag=0}{
		if ($2 == file)
			flag = 1
		if (flag == 1)
		{
			if ($1 == "Copied:")
				print $2
		}
 }' ~/backup-report | {
	buffer=$(awk '{print $0}')
	for i in $buffer
	do
		cp ~/backup/$backup/$i ~/restore/
	done
}
exit 0
