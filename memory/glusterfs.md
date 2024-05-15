# Gluster FS

## All Gluster Node

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

```bash
sudo systemctl enable --now glusterd
```

Ubuntu

```bash
sudo apt install glusterfs-server glusterfs-client -y
```

```bash
sudo systemctl enable --now glusterd
```

## Storage Node

```bash
sudo gluster peer probe node-2
```

```bash
sudo gluster peer status
```

```bash
sudo -p /mnt/appdata/myfiles
sudo chmod 775 /mnt/appdata -R
```

```bash
sudo gluster volume create myvol transport tcp node-1:/mnt/appdata/myfiles
```

```bash
sudo gluster volume start myvol
```

```bash
sudo gluster volume info
```

### Add Nodes to volume

```bash
sudo gluster volume add-brick myvol node-2:/mnt/appdata/myfiles 
# sudo gluster volume add-brick myvol node-2:/appdata/myfiles force
```

```bash
sudo gluster volume rebalance myvol start
```
