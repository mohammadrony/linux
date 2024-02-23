# VMs Network Interface setup

## Ubuntu 22

### NAT and Host-only network mode

Using static ip address for Host-only can be useful to communicate with applications.

Goto VM Network Settings > Select Adapter 1 as 'NAT' > Adapter 2 as 'Host-only Adapter' > Select the Name of Host-only Adapter as well.

### Setup static ip address in Ubuntu

Edit connection (VirtualBox example)

```bash
sudo vi /etc/netplan/00-installer-config.yaml
```

```yaml
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3:
      dhcp4: true
      routes:
        - to: default
          via: 10.0.2.2
      nameservers:
        addresses:
          - 8.8.8.8
    enp0s8:
      dhcp4: no
      addresses:
        - 192.168.56.101/24
      routes:
        - to: default
          via: 192.168.56.1
      nameservers:
        addresses:
          - 8.8.8.8
```

```bash
sudo netplan apply
```

## CentOS 8/9

### Host-only and Bridge network mode

Using static ip address for **Host-only in Adapter 1** can be useful to communicate with applications.

Goto VM Network Settings > Select Adapter 1 as 'Host-only Adapter' > Adapter 2 as 'Bridge Adapter' > Select the Name for both Adapter as well.

### Setup static ip address in CentOS

```bash
sudo nmtui
```

Edit connection (VirtualBox example)

- Select an interface (enp0s3)
- IPv4 configuration (manual)
- Address (192.168.56.101)
- Subnet (255.255.255.0)
- Gateway (192.168.56.1)
- DNS server (8.8.8.8)
- Save and Apply

```bash
sudo ifdown enp0s3 && sudo ifup enp0s3
```
