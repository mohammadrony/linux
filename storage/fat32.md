# FAT32

Backup partition data (i.e. `/boot/efi`)

```sh
sudo mkdir /boot/efi_backup
sudo cp -r /boot/efi /boot/efi_backup
```

Unmount the partition

```sh
sudo umount /boot/efi
```

Create a new FAT32 filesystem (This will delete all data on the partition)

```sh
sudo mkfs.fat -F32 /dev/sdX1
```

Remount partition

```sh
sudo mount /dev/sdX1 /boot/efi
```

Restore backup

```sh
sudo cp -r /boot/efi_backup/* /boot/efi/
```

Verify partition size

```sh
df -h /boot/efi
```
