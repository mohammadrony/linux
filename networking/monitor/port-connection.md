# Monitoring Network Connections

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

List of process size

```bash
ps aux | grep -E 'httpd|apache2' | grep -v grep | awk '{print $6/1024;}'
```

Average process size

```bash
ps aux | grep -E 'httpd|apache2' | grep -v grep | awk '{print $6/1024;}' | awk '{avg += ($1 - avg) / NR;} END {print avg " MB";}'
```
