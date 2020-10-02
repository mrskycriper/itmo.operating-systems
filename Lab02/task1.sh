#!bin/bash

ps aux | awk '{if ($1 = "user") print}' | wc -l > out/task1.out

echo "\n" >> out/task1.out

ps aux | awk '{if ($1 = "user") print($2" : "$(11))}' >> out/task1.out




