# LVM Management

LVM command prompt

```bash
sudo lvm
```

List of logical volumes

```lvm
lvdisplay
```

```lvm
lvscan
```

Partition size modification

```lvm
lvresize -L -4G /dev/ol/part1
```

```lvm
lvresize -L +4G /dev/ol/part2
```

Check partition type

```bash
lsblk -f
```

Apply for XFS partition

```bash
sudo xfs_growfs /dev/mapper/ol-part2
```
