# OpenSSL

[SSL For Free](https://www.sslforfree.com/)

Certificate validation

```bash
openssl s_client -host www.example.com -port 443
```

Renew certificate

```bash
openssl req -new -key /etc/ssl/private/www.example.com.key -out /etc/ssl/certs/www.example.com.csr
```

Generate certificate

```bash
openssl req -new -newkey rsa:2048 -nodes -keyout /etc/ssl/private/www.example.com.key -out /etc/ssl/certs/www.example.com.csr
```
