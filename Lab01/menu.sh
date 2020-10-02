#!/bin/bash

echo "Menu:"
echo "1) Start nano"
echo "2) Start vim"
echo "3) Start links"
echo "4) Exit menu"
read action

case $action in
1 )
nano
;;
2 )
vi
;;
3 )
links
;;
4 )
exit 0
;;
esac
