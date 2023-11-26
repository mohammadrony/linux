IFS=" "
while read i ; do echo $i; done < file1.txt # line separate
for i in $(cat ./file1.txt) ; do echo $i; done # space separate
