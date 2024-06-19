# Troubleshooting Apps

<https://www.youtube.com/watch?v=cSVvhUnE4hc>

1. Characters Unicode vaules.

2. Immutablility of files and folders.

3. Changing file permission without chmod.

   ```bash
   /lib/ld-linux.so /bin/chmod +x /path/to/file
   ```

   ```bash
   lsattr /path/to/file
   ```

   ```bash
   chattr -i /path/to/file
   ```

4. Change monitoring in file system

   - Install swift-kit
   - Run `fls -m/ -r /dev/sdX`
