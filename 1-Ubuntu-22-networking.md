# NAT and Host-only network setup in Ubuntu 22

## Configure VM settings for NAT and Host-only

Got your VM's Network Settings > Select Adapter 1 as 'NAT' > Adapter 2 as 'Host-only Adapter' > Select the Name of Host-only Adapter as well.

## Update network configuration

```
sudo cat > /etc/netplan/00-installer-config.yaml << EOF
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3: # Nat connection
      dhcp4: true
      routes:
        - to: default
          via: 10.0.2.2
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
    enp0s8:
      dhcp4: no
      addresses:
        - 192.168.56.106/24
      routes:
        - to: default
          via: 192.168.56.1
      nameservers:
        addresses:
          - 192.168.1.200
EOF
sudo netplan apply
```

Thank you.
