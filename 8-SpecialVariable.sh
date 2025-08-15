#!/bin/bash

echo "All variables passed to the shell script : $@ "
echo "Number of variables passed : $# "
echo "Current Directory : $PWD "
echo " User running this script : $USER"
echo " Home directory of the user : $HOME"
echo " PID of the SCRIPT : $$ "
sleep 10 &
echo " PID last command in background : $! "
