#!/bin/bash

(mkdir ~/test 2> /dev/null) && (echo $"Catalog test was created successefully" > ~/report.log) && touch ~/test/"$(date +"%d.%m.%y_%H:%M:%S")"


(ping -w 1 "www.net_nikogo.ru" 2> /dev/null) || echo $(date +"%d.%m.%y_%H:%M:%S Cant reach the server") >> ~/report.log
