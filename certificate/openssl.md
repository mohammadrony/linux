# OpenSSL

[SSL For Free](https://www.sslforfree.com/)

```sh
openssl -h
openssl x509 -h
```

View certificate

```sh
openssl x509 -in /path/to/file.pem -text -noout
```

Check validity date

```sh
openssl x509 -in /path/to/file.pem -dates -noout
```

```sh
openssl x509 -in /path/to/file.pem -text -noout | grep -i validity -A 2
```

Domain certificate validity

```sh
openssl s_client -host www.example.com -port 443
```

```sh
openssl s_client -connect www.example.com:443 < /dev/null | openssl x509 -noout -dates
```

Renew certificate

```sh
sudo openssl req -new -key /etc/ssl/private/www.example.com.key -out /etc/ssl/certs/www.example.com.csr
```

Generate certificate

```sh
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/ssl/private/www.example.com.key -out /etc/ssl/certs/www.example.com.csr
```

Decode CSR file

```sh
openssl req -text -in /etc/ssl/certs/www.example.com.csr
```
