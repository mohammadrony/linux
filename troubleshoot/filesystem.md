# Filesystem

## /dev/sdX1 contains a filesystem with error

Hard disk scan

- Enter into GRUB menu with `ESC` key
- Start with Advanced optioins for Ubuntu
- Select Ubuntu with recovery mode
- Scan devices and monitor logs

Check and repair filesystem

```sh
sudo fsck /dev/sdX1

# y for yes
# a for all yes
```

## Device status

SMART monitoring

```sh
sudo apt install -y smartmontools
```

Check status

```sh
sudo smartctl -H /dev/sdX
```

Details information

```sh
sudo smartctl -a /dev/sdX
```
