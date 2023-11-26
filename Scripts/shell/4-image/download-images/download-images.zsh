cat abc.json | 
  grep '"url": "https://' | 
  sed 's/.*\(https:.*\)",/\1/' | 
  while read link
    do 
    curl -s -L -I $link |
      gawk -v IGNORECASE=1 '/^Content-Length/ { print $2 }' |
      read length
    echo $length
    length="${length//[$'\t\r\n ']}"
    max_length=2500000
    if [[ "$length" -ge "$max_length" ]]
      then
      i=$(($i+1))
      curl $link -o images/$i.jpeg
    else
      count=$(($count+1))
      echo $count
    fi
  done 

