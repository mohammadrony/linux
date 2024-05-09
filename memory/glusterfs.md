# Gluster FS

## Storage Node Setup

CentOS

```bash
sudo dnf -y install centos-release-gluster11
```

```bash
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-Gluster-11.repo
```

```bash
sudo dnf --enablerepo=centos-gluster11,powertools -y install glusterfs-server
```

Ubuntu

```bash
sudo apt install glusterfs-server
```

Storage configuration

```bash
sudo systemctl enable --now glusterd
```

```bash
sudo gluster peer probe node_2
```

```bash
sudo gluster peer status
```

```bash
sudo gluster volume create myvol transport tcp node_1:/data force
```

```bash
sudo gluster volume start myvol
```

```bash
sudo gluster volume status
```

## Client Setup

```bash
sudo apt install -y glusterfs-client
```

```bash
mount -t glusterfs node_1:/myvol /mnt
```
