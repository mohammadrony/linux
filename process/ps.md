# Process Status

List running process

```bash
ps auxf
```

```bash
ps -ef
ps -ef | grep foo
```

Pid from process

```bash
pidof nginx
```

Process from pid

```bash
ps -p <PID> -o comm=
```

Top memory usage

```bash
ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -5
```

List of process size

```bash
ps aux | grep -E 'nginx|httpd|apache2' | grep -v grep | awk '{print $6/1024;}'
```

Average process size

```bash
ps aux | grep -E 'nginx|httpd|apache2' | grep -v grep | awk '{print $6/1024;}' | awk '{avg += ($1 - avg) / NR;} END {print avg " MB";}'
```
