# Disk Storage Management

## Make changes by Gparted

1. Attach bootable Ubuntu device
2. Boot to new Ubuntu
3. Open Gparted
4. Modify a partition or a disk
5. Save new changes
6. Reboot system

## Disk Information

### SSD check

- HDD for 1
- SSD for 0

```sh
lsblk -d -o name,rota
cat /sys/block/sdX/queue/rotational
```

### Disks and mountpoints

```sh
findmnt
```

```sh
ls -l /dev/disk/by-uuid
```

```sh
blkid
```

```sh
sudo dumpe2fs /dev/sdX | grep UUID
```

List block device

```sh
lsblk -f | grep -v loop
```

```sh
lsblk -o PATH,SIZE,RO,TYPE,MOUNTPOINT,UUID,MODEL,PARTUUID | grep -v loop
```

List attached hardware

```sh
hwinfo --all
hwinfo --all --short
```

```sh
hwinfo --disk --short
```

```sh
sudo lshw -class disk
```

```sh
duf
```

## Mount volumes in ext4 partition

Create or format the device (WIPE ALL PREVIOUS DATA)

```sh
sudo fdisk /dev/sdX
> Press 'g' to create gpt formated
> Press 'n' to create new partition
> Enter partition table information
> Press 'w' to save partition table
```

```sh
sudo mkfs.ext4 /dev/sdX1
```

Mount ext4 formatted device

```sh
sudo mkdir /mnt/foo
sudo mount /dev/sdX1 /mnt/foo -t ext4
```

Mount storage device on startup

```sh
sudo vi /etc/fstab

# <file system> <mount point>   <type>  <options>         <dump>  <pass>
UUID=<uuid>     /               ext4    errors=remount-ro 0       1
UUID=<uuid>     /boot/efi       vfat    umask=0077        0       1
/dev/sdX1       /mnt/foo        ext4    defaults          0       2
/swapfile       none            swap    sw                0       0
...
...
```

## Setup Swap memory

[Online Article](https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-22-04)

Check swap status

```sh
sudo swapon --show
free -h
```

Create swapfile

```sh
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
```

Mark the file as swap space

```sh
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show
```

Create permanent entry in fstab

```sh
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

```sh
free -h
```

Additional settings

```sh
cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure
```

```sh
sudo sysctl vm.swappiness=30
sudo sysctl vm.vfs_cache_pressure=50
```

```sh
sudo vi /etc/sysctl.conf

# Add
vm.swappiness=30
vm.vfs_cache_pressure=50
```

```sh
cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure
```
