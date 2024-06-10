# IP Address

All ip address (private)

```bash
ip a
ip addr show eth0
```

```bash
ip addr | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
```

Internet facing ip address (public)

```bash
curl ifconfig.me
```
