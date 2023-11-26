#!/bin/bash
echo "this"
echo "is" >&2
echo "a" >&3
echo "test." >&4
echo "this"
echo "is" >&2
echo "a" >&3
echo "test." >&4

#2>/dev/null redirects error to /dev/null
#1>/dev/null redirects stdout to /dev/null
#2>/dev/null 1>&2 first redirects error to /dev/null then redirects stdout to stderr (error) 's address
#   means to the /dev/null
 
# execute the below command into a terminal from this directory
#. write-text-into-different-files.bash >file1.txt 2>file2.txt 3>file3.txt 4>file4.txt