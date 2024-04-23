# Gluster FS

## All Gluster Node

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

## Storage Node

```bash
sudo gluster peer probe node_2
```

```bash
sudo gluster peer status
```

```bash
sudo gluster volume create myvol transport tcp node_1:/data
```

```bash
sudo gluster volume start myvol
```
