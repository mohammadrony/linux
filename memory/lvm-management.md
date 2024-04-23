# LVM Management

## Create Volume from disk

```bash
lsblk
lsblk -f
```

Create or format the device (WIPE ALL PREVIOUS DATA)

```bash
sudo fdisk /dev/sdX
> Press 'g' to create gpt formated
> Press 'n' to create new partition
> Enter partition table information
> Enter 't' to select partition type
> Enter 'L' to see all types
> Enter '31' for Linux LVM
> Enter 'p' to print partition table
> Press 'w' to save partition table
```

Create physical volume

```bash
sudo pvcreate /dev/sdX1
sudo pvdisplay
sudo vgcreate vg-data /dev/sdX1
```

Create logical volume

```bash
sudo lvcreate --name lv-data -l 100%FREE vg-data
sudo lvdisplay
```

Make filesystem

```bash
sudo mkfs.xfs /dev/vg-data/lv-data
```

```bash
sudo mkdir /appdata
sudo mount /dev/vg-data/lv-data /appdata
```

Mount storage device on startup

```bash
sudo vi /etc/fstab
```

```fstab
# <file system>       <mount point>   <type>  <options>         <dump>  <pass>
/dev/vg-data/lv-data   /appdata        xfs    defaults          0       2
```

```bash
sudo reboot now
# sudo systemctl daemon-reload
```

## Extend Volume from disk

volume groups

```bash
sudo vgs
sudo vgscan
```

Create or format the device

```bash
sudo fdisk /dev/sdY
> Press 'g' to create gpt formated
> Press 'n' to create new partition
> Enter partition table information
> Enter 't' to select partition type
> Enter 'L' to see all types
> Enter '31' for Linux LVM
> Enter 'p' to print partition table
> Press 'w' to save partition table
```

Create physical volume

```bash
sudo pvcreate /dev/sdY1
sudo pvdisplay
sudo vgextend vg-data /dev/sdY1
```

Logical volume

```bash
sudo lvs
sudo lvscan
```

```bash
sudo lvextend -l +100%FREE /dev/vg-data/lv-data
# sudo lvextend -L +5G /dev/vg-data/lv-data
```

```bash
sudo xfs_growfs /dev/vg-data/lv-data
```

## Remove partition

```lvm
sudo lvremove /dev/vg-data/lv-data
```
