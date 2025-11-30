# Gluster FS

## Storage Node Setup

CentOS

```sh
sudo dnf -y install centos-release-gluster11
```

```sh
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-Gluster-11.repo
```

```sh
sudo dnf --enablerepo=centos-gluster11,powertools -y install glusterfs-server
```

Ubuntu

```sh
sudo apt install glusterfs-server
```

```sh
sudo systemctl enable --now glusterd
```

Storage setup

```sh
sudo gluster peer probe node_2
```

```sh
sudo gluster peer status
```

```sh
sudo -p /mnt/appdata
sudo chmod 775 /mnt -R
```

```sh
sudo gluster volume create myvol transport tcp node_1:/data force
```

```sh
sudo gluster volume start myvol
```

```sh
sudo gluster volume info
```

Add storage to gluster

```sh
sudo gluster volume add-brick myvol node_2:/data force
```

```sh
sudo gluster volume rebalance myvol start
sudo gluster volume status
```

## Client Setup

```sh
sudo apt install -y glusterfs-client
```

```sh
mount -t glusterfs node_1:/myvol /mnt/appdata
```

## Cleanup

Unmount

```sh
sudo umount -f -l /mnt/appdata
```
