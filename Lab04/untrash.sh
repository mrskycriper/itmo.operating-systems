#!/bin/bash

if [[ -z "$1" ]]
then
	echo "Error, invalid arguments"
fi

for i in "$(cat ~/.trash.log | awk -v trashedFileName=$1 '$1 ~ "/*/"trashedFileName {print $0}')";
do
	echo $(echo $i | awk '{print $1}')
	echo "Restore Y/N?"
	read line
	if [[ ("$line" != "Y") && ("$line" != "N") ]]
	then
		echo "Error, unknown input"
		exit 1
	else if [[ "$line" == "Y" ]]
	then
		fullName=$(echo "$i" | awk '{print $1}')
		shortName=$(echo "$i" | awk '{print $2}')
		path=$(echo "$fullName" | awk -F "/" '{
							for(i=1;i<NF;i++){
								printf "%s/",$i
								}
						}')
		find $path 2> /dev/null > /dev/null
		
		if [[ $? == "1" ]]
		then
			fullName=~/$1
			echo "Warning, file will be restored to the home durectory"
		fi

		while true;
		do
			find $fullName 2> /dev/null > /dev/null
			if [[ $?? == "0" ]]
			then
				echo "Warning^ name collision. Please choose a new name: "
				read newName
				fullName=="$(echo "$fullName" | awk -F "/" '{
							for(i=1;i<NF;i++){
								printf "%s/",$i
								}
						}')$newName"
			else
				break;
			fi
		done
		sed -i "/ $shortName/d" ~/.trash.log
		mv ~/.trash/$shortName $fullName
		break;
	fi
fi
done

exit 0
