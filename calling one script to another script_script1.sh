#/bin/bash
GREETINGS="HELLO I AM GOOD, HOW ARE YOU?"
echo "$GREETINGS"
echo "PID of script: $$"
#method1 -> not recommonded
# [./script2.sh] #here we can't access the content of script2 from script 1, so not to recommond
#method 2 -> this one we can access everything from script2 from script one only ex: content
source ./script2.sh 