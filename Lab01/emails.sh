#!/bin/bash

grep -Eosh "[[:alnum:]]+\@[[:alnum:]]+\.[[:alnum:]]+" /etc/* | sed -z 's/\n/, /g' | sed -z 's/, $//' > emails.lst
exit 0
