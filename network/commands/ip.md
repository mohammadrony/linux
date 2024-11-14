# ip

List IP address details

```bash
ip a
ip addr show eth0
```

List only IP addresses

```bash
hostname -I
```

```bash
ip addr | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
```

Internet facing ip address (public)

```bash
curl ifconfig.me
```
