# Input Output

IO speed without disk write

```bash
time dd if=/dev/zero of=/dev/null count=1000000
```

Disk write IO speed in `/`

```bash
sudo su

touch /testfile
time dd if=/dev/zero of=/testfile bs=1M count=1024 oflag=direct
```

Disk read IO speed in `/`

```bash
time dd if=/testfile of=/dev/null bs=1M count=1024 iflag=direct
```
