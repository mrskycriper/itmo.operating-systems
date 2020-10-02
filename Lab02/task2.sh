#!/bin/bash

ps aux | awk '{if ($(11)~"^/sbin?*") print($2)}' > out/task2.out
