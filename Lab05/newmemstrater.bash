#!/bin/bash

for (( K=0; K<30; K++ ))
do
  	bash newmem.bash 793000 &
        sleep 1
done

exit 1
