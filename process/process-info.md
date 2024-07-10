# Process Info

List running process

```bash
ps auxf | grep <PROGRAM>
ps -ef | grep <PROGRAM>
```

List process by memory usage

```bash
sudo python ps_mem.py
```

Pid to process

```bash
ps -p $PID -o comm=
```

```bash
ps -p $PID -o pid,vsz=MEMORY -o user,group=GROUP -o comm,args=ARGS
```

Top memory usage

```bash
ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -5
```

List of process size

```bash
ps auxf | grep -E 'nginx|httpd|apache2' | grep -v grep | awk '{print $6/1024;}'
```

Average process size

```bash
ps auxf | grep -E 'nginx|httpd|apache2' | grep -v grep | awk '{print $6/1024;}' | awk '{avg += ($1 - avg) / NR;} END {print avg " MB";}'
```
