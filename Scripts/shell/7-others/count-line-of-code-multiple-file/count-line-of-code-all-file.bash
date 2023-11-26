find */src -exec wc -l {} \; 2>/dev/null | sed 's/ .*//g' | while read num; do sum=$(($sum+$num)); echo $sum; done | tail -1
