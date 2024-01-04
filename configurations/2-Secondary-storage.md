# Secondary Storage Management in Linux

## Gparted

1. Attach bootable Ubuntu device
2. Boot to new Ubuntu
3. Open Gparted
4. Modify a partition or a disk
5. Save new changes
6. Reboot system

## Collect Disk Information

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
lsblk -o PATH,SIZE,RO,TYPE,MOUNTPOINT,UUID,MODEL
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
