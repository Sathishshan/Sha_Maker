#!/bin/bash
#the script is to make the sha1sum for the given path
#get the valid input parameter from the analyst and make the sha value and printout the output in the shacooked.txt


#argument check

if [ $# -ne 1 ]; then
    echo "Need one argument to run the script e.g: $0 filename"
    exit
fi

#working area
#here sed is used to avoid the ^M control character at the END of the line. ^M is equilatent to \r #carriage return.
cat $1 | sed 's@\^M$@@g' | while read line
do
  find $line -exec sha1sum {} \; | awk '{print $2", "$1}'
done > shacooked.txt
echo "Sha value has been cooked, eat fast while it is Hot."
