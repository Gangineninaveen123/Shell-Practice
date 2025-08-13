#!/bin/bash

Timestamp=$(date) # dynamic output so we are pitting date in () braces

echo "Date dynamic output : $Timestamp "

num1=naveen
num2=100

sum=$(($num1+$num2))
echo "sum of $num1 + $num2 is : $sum"
