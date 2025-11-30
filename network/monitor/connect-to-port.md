# Connect to Port

Running service in TCP port

```sh
netstat -nltp
```

Scan open ports

```sh
nmap <host>
```

```sh
nmap -p <port> <host>
```

```sh
nmap -p 1-65535 <host>
```

Connect to a port

```sh
telnet <host> <port>
```

```sh
ncat -vz <host> <port>
```

```sh
nc -vz <host> <port>
```

```sh
nc -vz -w3 <host> <port>
```
