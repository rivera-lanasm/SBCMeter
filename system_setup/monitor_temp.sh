#!/bin/bash

OUT_PATH="/home/homer/diagnostic_src/data/core_temp.txt"
ERROR_PATH="/home/homer/diagnostic_src/error/core_temp.txt"

while true; do
        temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
        echo "$(date) Temperature: $temp" >> $OUT_PATH 2>> $ERROR_PATH
        sleep 300
done
