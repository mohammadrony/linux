# ip

List IP address details

```sh
ip a
ip addr show eth0
```

List only IP addresses

```sh
hostname -I
```

```sh
ip addr | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
```

Internet facing ip address (public)

```sh
curl ifconfig.me
```

Routing table

```sh
ip r
ip route
```
