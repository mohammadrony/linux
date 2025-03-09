# FAT32

Backup partition data (i.e. `/boot/efi`)

```bash
sudo mkdir /boot/efi_backup
sudo cp -r /boot/efi /boot/efi_backup
```

Unmount the partition

```bash
sudo umount /boot/efi
```

Create a new FAT32 filesystem (This will delete all data on the partition)

```bash
sudo mkfs.fat -F32 /dev/sdX1
```

Remount partition

```bash
sudo mount /dev/sdX1 /boot/efi
```

Restore backup

```bash
sudo cp -r /boot/efi_backup/* /boot/efi/
```

Verify partition size

```bash
df -h /boot/efi
```
