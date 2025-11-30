# LVM Management

## Create Volume from Disk

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
> Select 'Linux LVM' id number i.e. '30'
> Enter 'p' to print partition table
> Press 'w' to save partition table
```

Create physical volume

```sh
sudo pvcreate /dev/sdX1
sudo pvdisplay
sudo vgcreate vg-data /dev/sdX1
```

Create logical volume

```sh
sudo lvcreate --name lv-data -l 100%FREE vg-data
sudo lvdisplay
```

Make filesystem

```sh
sudo mkfs.xfs /dev/vg-data/lv-data
# sudo mkfs.xfs -f /dev/vg-data/lv-data
```

```sh
sudo mkdir /appdata
sudo mount /dev/vg-data/lv-data /appdata
```

Mount storage device on startup

```sh
sudo vi /etc/fstab
```

```fstab
# <file system>       <mount point>    <type>   <options>   <dump>  <pass>
/dev/vg-data/lv-data    /appdata        xfs     defaults      0       2
```

```sh
sudo systemctl daemon-reload
```

## Extend Volume from Disk

### Create partition

Volume group

```sh
sudo vgs
sudo vgscan
```

Create or format the device

```sh
sudo fdisk /dev/sdY
> Press 'g' to create gpt formated
> Press 'n' to create new partition
> Enter partition table information
> Enter 't' to select partition type
> Enter 'L' to see all types
> Enter '30' for Linux LVM
> Enter 'p' to print partition table
> Press 'w' to save partition table
```

Create physical volume

```sh
sudo pvcreate /dev/sdY1
sudo pvdisplay
sudo vgextend vg-data /dev/sdY1
```

Logical volume

```sh
sudo lvs
sudo lvscan
```

### Extend volume

```sh
sudo lvextend -l +100%FREE /dev/vg-data/lv-data
# sudo lvextend -L +5G /dev/vg-data/lv-data
```

Extend xfs partition

```sh
sudo xfs_growfs /dev/vg-data/lv-data
```

Extend ext4 partition

```sh
sudo resize2fs /dev/vg-data/lv-data
```

## Cleanup

Backup data from mount point

- `/appdata`
- `/disk`

Unmount volume

```sh
sudo umount /dev/vg-data/lv-data
```

Remove volume

```sh
sudo lvremove /dev/vg-data/lv-data
```
