#!/bin/bash
# for company purpose use everything in neat format

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



#[************************ -> MAIN CODE
#source directory - home path of logs, which we are going to delete
SOURCE_DIR=/home/ec2-user/app_logs

#finding .log files having more than 14 days history
FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mdate +14)

#while loop for delting log files
while IFS= read -r line
do
    echo "Deleting files:: $line" | tee -a $LOG_FILE
    rm -rf $FILES_TO_DELETE
done <<< $FILES_TO_DELETE  #<<<-> MEANS taking output from mobax terminal or any terminal directory

#****************************] THIS IS ENOUGH FOR INTERVIEW

echo "script executed:: $G sucessfully..  $N "
#End Time
print_time
