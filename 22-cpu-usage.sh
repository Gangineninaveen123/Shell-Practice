#!/bin/bash

# Get CPU utilization (user + system)
 #code ll get from google
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
    echo "CPU Utilization: $CPU_USAGE"
    


#


