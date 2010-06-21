#!/bin/bash
#*******************************************************#
#                 recreate.sh
#                 written by Rahul Kumar                #
#                    2009/12/01                         #
#  recreate a failed test - pass the name of the earlier#
#  test program. In some cases, you may have to rename  #
#  transcript.txt to the testcase since cp -i failes    #
#*******************************************************#

# oldfile is the old test cases such as t0001-add.sh
oldfile="$1"
[ ! -f "$oldfile" ] && { echo "Could not find $oldfile"; exit -1 ; }

LOADSTR=
if grep -q CATEOF "$oldfile"; then
   sed -n '/<<CATEOF/,/^CATEOF/p' "$oldfile" | grep -v "CATEOF" > data.1
   LOADSTR='--load data.1'
   echo found data, saved as data.1
   wc -l data.1
fi
str=$( echo "$oldfile" | sed 's/^t[0-9]*-//;s/.sh$//' )
echo "Using suffix:$str"
read -p "press enter "
grep '^>>> ' "$oldfile" | sed 's/^>>> //' 
read -p "press enter "
grep '^>>> ' "$oldfile" | sed 's/^>>> //' | ./rtest2.sh $LOADSTR "$str"

echo
echo renaming old file with O prefix
mv "$oldfile" O$oldfile
echo "If you don't find a test case, then rename transcript.txt to $oldfile"
echo "cp transcript.txt $oldfile"
