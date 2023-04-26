#!/bin/bash

OUT_PATH="$1/temp_monitor.txt" #"/home/homer/rbpi_monitor/data/temp_monitor.txt"
ERROR_PATH="$2/temp_monitor.txt" #"/home/homer/rbpi_monitor/error/temp_monitor.txt"

while true; do
        temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
        echo "$(date) Temperature: $temp" >> $OUT_PATH 2>> $ERROR_PATH
        sleep 300
done
