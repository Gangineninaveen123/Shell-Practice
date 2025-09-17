#!/bin/bash
#Creating source dir
SOURCE_DIR=$1
#Creating destination dir
DEST_DIR=$2
#NO_OF_DAYS=${3:-14} means: Take the 3rd argument if provided, otherwise default to 14., if days are given, it ll consider..., by default 14 days
DAYS=${3:-14}


#start time
START_TIME=$(date +%s)
# Checking root access 
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
# Creating Log file ending with .log ectenstion, ex: var/log/roboshop-logs/13-logs.log
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
#Creating absolute path, so we can access the app in any location with out any error, for ex: /app-> from this location also i can acces caatalogue code i app tier
SCRIPT_DIR=$PWD

# creating LOGS_FOLDER so, we can store our logs in it. [-p -> means, if same folder already created also it wont give error]
mkdir -p $LOGS_FOLDER
# script starting date and time, so easy like like which script executes at what time and need to store in LOG_FILE
echo "Script started and executed at: $(date)" | tee -a $LOG_FILE

# Checking user has root previlages to run or not
check_root(){
    if [ $USERID -ne 0 ]
    then
        echo -e " $R ERROR:: Please run the shell script with root user $N" | tee -a $LOG_FILE # here $R which starts colour as Red, and at ending $N ll make it as Normal.
        exit 1 # give other than zero[1-127] as exit code, so it ll not move forward from this step.
    else
        echo "You are running with root user" | tee -a $LOG_FILE

    fi
}
check_root

#, here $1 -> means takes exit code $? as input $2 argument, which is given in the code, while calliong function

VALIDATE()
{
     if [ $1 -eq 0 ]  # the exit code represents always sucess
    then
        echo -e " $2 is $G  Sucessfull.... $N" | tee -a $LOG_FILE
    else
        echo -e " $2 $R  is failure.... $N" | tee -a $LOG_FILE
        exit 1 # when ever the failure is there in shell script, then we should automatically give exit than zero, mainly 1
    fi
}

#Checking source and destination is there or not
USAGE(){
    echo -e " $R USAGE :: $N sh 18-backupscript.sh <source-dir> <destination-dir> <no of days>(optional)"
}

if [ $# -lt 2 ]
then
    USAGE
fi

#checking mainly souce and folder are there not
if [ ! -d $SOURCE_DIR ] # -d means directory
then
    echo -e "$R source directory :: $SOURCE_DIR does not exit. Please check... $N"
fi

#checking mainly destination and folder are there not
if [ ! -d $DEST_DIR ] # -d means directory
then
    echo -e "$R destination directory :: $DEST_DIR does not exit. Please check... $N"
fi

#My own code tried *****
#  if [ -d $SOURCE_DIR && -d $DEST_DIR ]
#  then
#     echo "✅ Both files exist: $SOURCE_DIR and $DEST_DIR"
# else
#     echo "❌ One or both files are missing"
#     exit 1   # Exit the whole script, not just the function
# 
#*****************

#fineding file to spe3cific dates
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

#Thinks file is empty, tthen below command need to use, and here Using -z  means(string length is zero)

if [ -z $FILES ]
then
    echo -e "NO log files found older than 14 days .... $Y Skipping.. $N"
else
    echo "Files to Zip are: $FILES"
    #timestamp, at which time its zipped F-format, H-hour, M-min,S-sec
    TIMESTAMP=$(date +%F-%H-%M-%S)
    #zip file making
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip" 
    #ziping command for all the files and saving it in DEST_DIR 
    echo $FILES | zip -@ $ZIP_FILE
fi