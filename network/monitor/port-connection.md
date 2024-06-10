# Network connections

Running service in TCP port

```bash
netstat -nltp
```

Scan available ports to connect

```bash
nmap example.com
```

Test connect to an open port

```bash
telnet example.com 22
```

Connected IP address

```bash
netstat -ntu|awk '{print $5}'|cut -d: -f1 -s|sort|uniq -c|sort -nk1 -r
```

Alive connection for HTTP service

```bash
netstat -ant | grep -E ':80|:443' | grep -v grep | wc -l
```

```bash
ss -ant | grep -E ':80|:443' | grep -v grep | wc -l
```
