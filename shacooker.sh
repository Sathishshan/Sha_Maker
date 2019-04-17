#!/bin/bash
#the script is to make the sha1sum for the given path
#get the valid input parameter from the analyst and make the sha value and printout the output in the shacooked.txt


#argument check

if [ -z $1 ]; then
    echo "Need one argument to run the script e.g: $0 filename"
    exit
fi

#working area

cat $1 | while read line
do
  find $line -exec sha1sum {} \; | awk '{print $2" "$1}' | sed 's/ /, /' >> shacooked.txt
done
echo "Sha value has been cooked, eat fast while it is Hot."
