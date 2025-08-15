#!/bin/bash

Number=$1

# -gt  -> greater than
# -lt  ->  lessthan
# -eq  ->  equals to
# -ne  -> Not equals to

if [ $Number -gt 10 ]
then
    echo "$Number is greater than 10"

else
    echo "$Number is less than 10"

fi