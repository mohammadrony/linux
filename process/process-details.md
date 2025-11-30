# Process Details

## ps commands

Process by command

```sh
ps -o pid,%cpu,%mem,cmd -C <command>
```

Print selected field

```sh
ps -eo pid,user,group,args,etime,lstart
```

## Process Memory

List process by memory usage

```sh
sudo python ps_mem.py
```

Top memory usage

```sh
ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -5
```

List of process size

```sh
ps auxf | grep -E 'nginx|httpd|apache2' | grep -v grep | awk '{print $6/1024;}'
```

Average process size

```sh
ps auxf | grep -E 'nginx|httpd|apache2' | grep -v grep | awk '{print $6/1024;}' | awk '{avg += ($1 - avg) / NR;} END {print avg " MB";}'
```
