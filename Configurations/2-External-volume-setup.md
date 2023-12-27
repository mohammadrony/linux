# Prepare External Volume in Linux

## Mount volumes for persistant storage

Attach block storage with operating system

List mounted device

   ```bash
   sudo ls -l /dev/disk/by-uuid
   ```

   ```bash
   sudo blkid
   ```

   ```bash
   sudo dumpe2fs /dev/sdX | grep UUID
   ```

List block device

   ```bash
   sudo lsblk -o PATH,SIZE,RO,TYPE,MOUNTPOINT,UUID,MODEL
   ```

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

   # Add
   /dev/sdX1   /mnt/foo   ext4 defaults 0  2
   ...
   ...
   ```
