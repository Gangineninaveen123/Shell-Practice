#!/bin/bash

USERID=$( id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run the shell script with root user"
    exit 1 # give other than zero[1-127] as exit code, so it ll not move forward from this step.
else
    echo "You are running with root user"

fi

# checking before installing mysql, was installed or not
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL IS not installed Yet, no MySQL going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]  # the exit code represents always sucess
    then
        echo "Installing MYSQL is Sucessfull...."
    else
        echo "Installing MYSQL is failure...."
        exit 1 # when ever the failure is there in shell script, then we should automatically give exit than zero, mainly 1
else
    echo "MySQL is already installed, no need to install again"


fi

