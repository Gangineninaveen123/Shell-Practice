#!/bin/bash

#Disk usage command, which removes headings like Use%
DISK_USGAE=$(df -hT | grep -v Use%)

#tHRESHOLD VALUE
DISH_THRESHOLD=1 #In Project it ll be 75 

#message needd to send for mail
MSG=""

# Reading line by line, which is executed in server, that one in done ll get, which those lines we are making itas code in do
while IFS= read line
do
    #getting like below for usage command
    # 0
    # 0
    # 2
    # 42
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)

    #Printing like /usr/bin [each location]
    PARTITION=$(echo $line | awk -F " " '{print $7F}')

    #Printing like ex: 0::/usr/bin [space in each location]
    # echo "$PARTITION:: $USAGE"

    if [ $USAGE -gt $DISH_THRESHOLD ]
    then
        MSG="High disk uage on :- $PARTITION:: $USAGE"
        
    fi

done <<< $DISK_USGAE

#printing MSG ON Console
echo $MSG