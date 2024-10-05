# Linux Files

## Remove old files

Remove files older than 30 days

```bash
set -eu
cd /path
find . -mtime +30 | xargs rm 2>/dev/null
```

## Remove old snap versions

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
echo 2 | sudo tee /proc/sys/vm/drop_caches
echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo swapoff -a
sudo swapon -a
```

## Log cleanup

```bash
cd /var/log
sudo cat /dev/null > messages
sudo cat /dev/null > wtmp
```

```bash
sudo journalctl --vacuum-size=200M
```
