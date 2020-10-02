#!/bin/bash

awk -F: '{print ($3 "\t" $1)}' /etc/passwd | sort -n
exit 0
