# Linux Files

## Remove old files

Remove files older than 30 days

```sh
set -eu
cd /path
find . -mtime +30 | xargs rm 2>/dev/null
```

## Remove old snap versions

```sh
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
  while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
  done
```

## Clear RAM cache and Swap

```sh
set -eu
sudo sync
echo 1 | sudo tee /proc/sys/vm/drop_caches
echo 2 | sudo tee /proc/sys/vm/drop_caches
echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo swapoff -a
sudo swapon -a
```

## Log cleanup

```sh
cd /var/log
sudo cp /dev/null > messages
sudo cp /dev/null > wtmp
```

```sh
sudo journalctl --vacuum-size=200M
```
