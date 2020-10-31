#!/bin/bash

./task4_loop.sh &
pid1=$!
./task4_loop.sh &
pid2=$!
./task4_loop.sh &
pid3=$!

renice +10 -p $pid1
kill $pid3

at now + 1 minute <<< "pkill task4_loop.sh"



