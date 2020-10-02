#!/bin/bash

man bash | grep -o '[[:alpha:]]\{4,\}' | uniq -ic | sort -rn | head -n 3
exit 0
