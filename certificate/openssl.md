# OpenSSL

[SSL For Free](https://www.sslforfree.com/)

Certificate validation

```bash
openssl s_client -host www.example.com -port 443
```

```bash
openssl s_client -connect www.example.com:443 < /dev/null | openssl x509 -noout -dates
```

Renew certificate

```bash
openssl req -new -key /etc/ssl/private/www.example.com.key -out /etc/ssl/certs/www.example.com.csr
```

Generate certificate

```bash
openssl req -new -newkey rsa:2048 -nodes -keyout /etc/ssl/private/www.example.com.key -out /etc/ssl/certs/www.example.com.csr
```
