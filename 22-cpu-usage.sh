#!/bin/bash

# Get CPU utilization (user + system)

while true;
do
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
    echo "CPU Utilization: $CPU_USAGE"
    sleep 5
done



