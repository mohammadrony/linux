# Hard Disk

Disk type

```bash
lsblk | grep disk | awk '{print $1}' | while read disk; do
  rotational=$(cat /sys/block/$disk/queue/rotational)
  if [ "$rotational" -eq 1 ]; then
    echo "$disk: HDD"
  else
    if [[ $disk == nvme* ]]; then
      echo "$disk: NVMe"
    else
      echo "$disk: SSD"
    fi
  fi
done
```

Write speed

```bash
cd /tmp
dd if=/dev/zero of=test_file bs=1M count=1024 oflag=direct
```

Read speed

```bash
cd /tmp
dd if=test_file of=/dev/null bs=1M iflag=direct
```
