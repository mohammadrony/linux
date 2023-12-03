# Cleanup Space

## Remove old Snap versions

```bash
set -eu
LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
  while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
  done
```

## Clear RAM cache and Swap

```bash
set -eu
sudo sync 
echo 1 | sudo tee /proc/sys/vm/drop_caches
sudo swapoff -a
sudo swapon -a
```
