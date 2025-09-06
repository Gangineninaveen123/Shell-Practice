#!/bin/bash

# \e is the starting, and we need to end, if not giving end, the downside also will have the same colour as same 
echo -e "\e[31m HelloWorld red colour \e[0m"
echo "Helloworld no colour"


#!/bin/bash
USERID=$(id -u)

# Creating Variables for Colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR:: Please run the shell script with root user $N" # here $R which starts colour as Red, and at ending $N ll make it as Normal.
    exit 1 # give other than zero[1-127] as exit code, so it ll not move forward from this step.
else
    echo "You are running with root user"

fi

#, here $1 -> means takes exit code $? as input $2 argument, which is given in the code, while calliong function

VALIDATE()
{
     if [ $1 -eq 0 ]  # the exit code represents always sucess
    then
        echo -e " Installing $2 is $G  Sucessfull.... $N"
    else
        echo -e "Installing $2 $R  is failure.... $N"
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
    echo -e " $Y MySQL is already installed, no need to install again $N"


fi

#INSTALLING PYTRHON3

dnf list installed python3

if [ $? -ne 0 ]
then
    echo " python3 IS not installed Yet, now python3 going to install"
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo "$Y Python3 is already installed, no need to install again $N"


fi
# Installing Nginx

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx IS not installed Yet, no nginx going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "$Y nginx is already installed, no need to install again $N"


fi
