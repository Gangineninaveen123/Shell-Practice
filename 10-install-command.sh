#!/bin/bash

USERID=$( id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run the shell script with root user"

else
    echo "You are running with root user"

fi

dnf install mysql -y
