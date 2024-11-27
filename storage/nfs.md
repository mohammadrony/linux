# NFS

## Server Configuration

Package setup

```bash
sudo apt install -y nfs-kernel-server
```

```bash
sudo systemctl enable --now nfs-kernel-server
```

Export mountpoint

```bash
sudo tee -a /etc/exports << EOF
/srv    *(ro,sync,subtree_check)
/home   *(rw,sync,no_subtree_check)
/nfs    *(rw,async,no_subtree_check,no_root_squash)
EOF
```

```bash
sudo exportfs -a
```

## NFS Client

### Mount Endpoint

Ubuntu

```bash
sudo apt install -y nfs-common
```

CentOS

```bash
sudo dnf install -y nfs-utils
```

```bash
sudo mkdir /appdata
sudo mount -t nfs 10.0.0.2:/nfs /appdata
```

```bash
sudo tee -a /etc/fstab << EOF
10.0.0.2:/nfs     /appdata    nfs     defaults   0 0
EOF
```

```bash
sudo mount -a
```

```bash
df -h
```

### Unmount

```bash
sudo umount /appdata
```

Lazy unmount

```bash
sudo umount -l /appdata
```

Force an unmount

```bash
sudo umount -f /appdata
```

```bash
sudo umount -f -l /appdata
```
