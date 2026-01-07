#!/bin/bash

# \e is the starting, and we need to end, if not giving end, the downside also will have the same colour as same 
echo -e "\e[31m HelloWorld red colour \e[0m" | tee
echo "Helloworld no colour"


#!/bin/bash
USERID=$(id -u)

# Creating Variables for Colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Creatring Logs folder variable , where logs ll be saved
LOGS_FOLDER="/var/log/shellscript-logs"
# not to have two end endpoints extension, so removing .sh for our convienince
SCRIPT_NAME=$(echo $0 | awk -F "." '{print $1F}')
# Creating Log file ending with .log ectenstion, ex: var/log/shellscript-logs/13-logs.log
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

# ************** note vvvvvv imp, where ever log is store in LOG_FILE, which shows on screen as output ex: echo, there i am going to use tee command [tee -a $LOG_FILE], so it can show  in screen as well as it store the info in LOG_FILE too.

# creating LOGS_FOLDER so, we can store our logs in it. [-p -> means, if same folder already created also it wont give error]
mkdir -p $LOGS_FOLDER
# script starting date and time, so easy like like which script executes at what time and need to store in LOG_FILE
echo "Script started and executed at: $(date)" | tee -a $LOG_FILE



if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR:: Please run the shell script with root user $N" | tee -a $LOG_FILE # here $R which starts colour as Red, and at ending $N ll make it as Normal.
    exit 1 # give other than zero[1-127] as exit code, so it ll not move forward from this step.
else
    echo "You are running with root user" | tee -a $LOG_FILE

fi

#, here $1 -> means takes exit code $? as input $2 argument, which is given in the code, while calliong function
# here actual execution not started for VALIDADATE(), from down side, it ll take values, when this function called, then only, it comes in frame, thats it.
VALIDATE()
{
     if [ $1 -eq 0 ]  # the exit code represents always sucess
    then
        echo -e " Installing $2 is $G  Sucessfull.... $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 $R  is failure.... $N" | tee -a $LOG_FILE
        exit 1 # when ever the failure is there in shell script, then we should automatically give exit than zero, mainly 1
    fi
}
# &>>, so this means both success, and failure deitals ll be looged in to the $LOG_FILE
dnf list installed mysql &>> $LOG_FILE

if [ $? -ne 0 ]
then
    echo "MySQL IS not installed Yet, no MySQL going to install" | tee -a $LOG_FILE
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e " $Y MySQL is already installed, no need to install again $N" | tee -a $LOG_FILE


fi

#INSTALLING PYTRHON3

dnf list installed python3 &>> $LOG_FILE

if [ $? -ne 0 ]
then
    echo " python3 IS not installed Yet, now python3 going to install"| tee -a $LOG_FILE
    dnf install python3 -y &>> $LOG_FILE
    VALIDATE $? "Python3"
else
    echo -e "$Y Python3 is already installed, no need to install again $N" | tee -a $LOG_FILE


fi
# Installing Nginx

dnf list installed nginx &>> $LOG_FILE

if [ $? -ne 0 ]
then
    echo "nginx IS not installed Yet, no nginx going to install" | tee -a $LOG_FILE
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx is already installed, no need to install again $N" | tee -a $LOG_FILE


fi
