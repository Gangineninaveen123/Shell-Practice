#!/bin/bash

#mail format
TO_TEAM=$1
#Alert type
ALERT_TYPE=$2
#Public ipv4 address of server
IP_ADDRESS=$3
#MSG  for the mail
MSG=$4
FINAL_MSG=$(printf '%s\n' "$MSG" | sed -e 's/[]\/$*.^[]/\\&/g') #any special characters comes example [].] meansit ll replace with [.\]

#To Address
TO_ADDRESS=$5

#FINAL BODY OF GMAIL
FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_ADDRESS/$IP_ADDRESS/g" -e "s/MSG/$MSG/g" 20-mail-templete.html)
#SUBJECT
SUBJECT=$6
# email sendinding disk usage another email info

{
echo "To: $TO_ADDRESS" # gangineninaveen132@gmail.com
echo "Subject: $SUBJECT" # Testing gmail for disk space monitoring
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY" #Testing Gmail Body from shell scripting
} | msmtp "$TO_ADDRESS" #gangineninaveen132@gmail.com