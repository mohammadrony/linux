# VM Specification

CPU

```sh
nproc
```

```sh
lscpu
lscpu | grep "Thread\|Core"
```

RAM

```sh
dmidecode -t 17 | grep Size
```

```sh
free -h | grep Mem | awk '{print $2}'
```

```sh
grep MemTotal /proc/meminfo | awk '{print $2 / 1024}'
```

```sh
lshw -c memory
```

Hard Disk

```sh
df -h
```

```sh
lsblk | grep "disk" | awk '{print $4}'
```

```sh
findmnt
```
