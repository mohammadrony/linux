# netstat

Running service in TCP port

```sh
netstat -nltp
```

Internet gateway

```sh
netstat -rn
```

```sh
netstat -rn | grep default
```

Connected IP address

```sh
netstat -ntu|awk '{print $5}'|cut -d: -f1 -s|sort|uniq -c|sort -nk1 -r
```

Alive connection for HTTP service

```sh
netstat -ant | grep -E ':80|:443' | grep -v grep | wc -l
```

Watch connections

```sh
watch 'for port in 80 443; do
  echo -n "port $port: "
  netstat -ant | grep -E ":$port" |
    grep -v grep | wc -l
done'
```
