#!/bin/bash

# Get memory details
MEMORY=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%s MB (%.2f%%)\n", $3,$2,$3*100/$2 }')

echo "$MEMORY"
