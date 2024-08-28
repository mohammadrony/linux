# NFS

## Mount

```bash
sudo dnf -y install nfs-utils
```

```bash
sudo mkdir /appdata
sudo mount -t nfs 10.0.0.1:/nfs /appdata
```

```bash
sudo tee -a /etc/fstab << EOF
10.0.0.1:/nfs     /appdata    nfs     defaults   0 0
EOF
```

```bash
sudo mount -a
```

```bash
df -h
```
