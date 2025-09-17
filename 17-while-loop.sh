# #!/bin/bash

# a=0

# while [ $a -lt 10 ]
# do
#     echo $a
#     a=`expr $a + 1`
# done
 
 #Taking the files line by line.....
 while IFS= read -r line  # IFS -> INTERNAL FIELD SEPERATOR AND $LINE MEANS LINE BY LINE IT READS
 do
    echo $line

 done < 15-loops.sh  # TAKING FILE AS INPUT
