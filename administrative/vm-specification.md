# VM Specification

CPU

```bash
nproc
```

```bash
lscpu
lscpu | grep "Thread\|Core"
```

RAM

```bash
dmidecode -t 17 | grep Size
```

```bash
free -h | grep Mem | awk '{print $2}'
```

```bash
grep MemTotal /proc/meminfo | awk '{print $2 / 1024}'
```

```bash
lshw -c memory
```

Hard Disk

```bash
df -h
```

```bash
lsblk | grep "disk" | awk '{print $4}'
```

```bash
findmnt
```
