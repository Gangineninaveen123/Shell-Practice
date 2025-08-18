#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run the shell script with root user"
    exit 1 # give other than zero[1-127] as exit code, so it ll not move forward from this step.
else
    echo "You are running with root user"

fi

VALIDATE()
{
     if [ $1 -eq 0 ]  # the exit code represents always sucess
    then
        echo "Installing $2 is Sucessfull...."
    else
        echo "Installing $2 is failure...."
        exit 1 # when ever the failure is there in shell script, then we should automatically give exit than zero, mainly 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL IS not installed Yet, no MySQL going to install"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySQL is already installed, no need to install again"


fi

#INSTALLING PYTRHON3

dnf list installed python3

if [ $? -ne 0 ]
then
    echo " python3 IS not installed Yet, now python3 going to install"
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo "Python3 is already installed, no need to install again"


fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx IS not installed Yet, no nginx going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed, no need to install again"


fi