# Connect to Port

Running service in TCP port

```bash
netstat -nltp
```

Scan open ports

```bash
nmap host
```

```bash
nmap -p port host
```

```bash
nmap -p 1-65535 host
```

Connect to a port

```bash
nc -vz host port
```

```bash
ncat -vz host port
```

```bash
telnet host port
```
