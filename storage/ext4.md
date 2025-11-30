# EXT4 Filesystem

## Mount Disk with existing data

```sh
lsblk
lsblk -f
```

Create or format the device (WIPE ALL PREVIOUS DATA).

*Update `sdX` to appropriate name.*

```sh
sudo fdisk /dev/sdX
> Press 'g' to create gpt formated
> Press 'n' to create new partition
> Enter partition table information
> Enter 't' to select partition type
> Enter 'L' to see all types
# > Select '' id number i.e. ''
> Enter 'p' to print partition table
> Press 'w' to save partition table
```

```sh
sudo mkfs.ext4 /dev/sdX1
# sudo mkfs.ext4 -f /dev/sdX1
```

```sh
sudo mkdir /appdata
sudo mount /dev/sdX1 /appdata
```

Mount storage device on startup

```sh
sudo vi /etc/fstab
```

```fstab
# <file system>       <mount point>    <type>   <options>   <dump>  <pass>
/dev/sdX1               /appdata        ext4     defaults      0       2
```

```sh
sudo systemctl daemon-reload
```

## Cleanup

Unmount

```sh
sudo umount /dev/sdX1
```
