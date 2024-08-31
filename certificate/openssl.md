# OpenSSL

[SSL For Free](https://www.sslforfree.com/)

```bash
openssl -h
openssl x509 -h
```

View certificate

```bash
openssl x509 -in /path/to/file.pem -text -noout
```

Check validity date

```bash
openssl x509 -in /path/to/file.pem -dates -noout
```

```bash
openssl x509 -in /path/to/file.pem -text -noout | grep -i validity -A 2
```

Domain certificate validity

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
