# NFS

## Server Configuration

Package setup

```sh
sudo apt install -y nfs-kernel-server
```

```sh
sudo systemctl enable --now nfs-kernel-server
```

Export mountpoint

```sh
sudo tee -a /etc/exports << EOF
/srv    *(ro,sync,subtree_check)
/home   *(rw,sync,no_subtree_check)
/nfs    *(rw,async,no_subtree_check,no_root_squash)
EOF
```

```sh
sudo exportfs -a
```

## NFS Client

### Mount Endpoint

Ubuntu

```sh
sudo apt install -y nfs-common
```

CentOS

```sh
sudo dnf install -y nfs-utils
```

```sh
sudo mkdir /appdata
sudo mount -t nfs 10.0.0.2:/nfs /appdata
```

```sh
sudo tee -a /etc/fstab << EOF
10.0.0.2:/nfs     /appdata    nfs     defaults   0 0
EOF
```

```sh
sudo mount -a
```

```sh
df -h
```

### Unmount

```sh
sudo umount /appdata
```

Lazy unmount

```sh
sudo umount -l /appdata
```

Force an unmount

```sh
sudo umount -f /appdata
```

```sh
sudo umount -f -l /appdata
```
