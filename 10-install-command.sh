#!/bin/bash

USERID=$( id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run the shell script with root user"
    exit 2 # give other than zero[1-127] as exit code, so it ll not move forward from this step.
else
    echo "You are running with root user"

fi

dnf install mysql -y
