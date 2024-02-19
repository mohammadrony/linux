# Secondary Storage Management in Linux

## Make changes by Gparted

1. Attach bootable Ubuntu device
2. Boot to new Ubuntu
3. Open Gparted
4. Modify a partition or a disk
5. Save new changes
6. Reboot system

## Disk Information

```bash
findmnt
```

```bash
ls -l /dev/disk/by-uuid
```

```bash
blkid
```

```bash
sudo dumpe2fs /dev/sdX | grep UUID
```

List block device

```bash
lsblk -f | grep -v loop
```

```bash
lsblk -o PATH,SIZE,RO,TYPE,MOUNTPOINT,UUID,MODEL,PARTUUID | grep -v loop
```

## Mount volumes for persistant storage

Create or formate the device (WIPE ALL PREVIOUS DATA)

```bash
sudo fdisk /dev/sdX
> Press 'g' to create gpt formated
> Press 'n' to create new partition
> Enter partition table information
> Press 'w' to save partition table
```

```bash
sudo mkfs.ext4 /dev/sdX1
```

Mount ext4 formatted device

```bash
sudo mkdir /mnt/foo
sudo mount /dev/sdX1 /mnt/foo -t ext4
```

Mount storage device on startup

```bash
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

```bash
sudo swapon --show
free -h
```

Create swapfile

```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
```

Mark the file as swap space

```bash
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show
```

Create permanent entry in fstab

```bash
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

```bash
free -h
```

Additional settings

```bash
cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure
```

```bash
sudo sysctl vm.swappiness=30
sudo sysctl vm.vfs_cache_pressure=50
```

```bash
sudo vi /etc/sysctl.conf

# Add
vm.swappiness=30
vm.vfs_cache_pressure=50
```

```bash
cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure
```
