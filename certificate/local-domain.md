# Local Domain

Generate certificate

```bash
tee -a root-certificate.conf << EOF
[req]
prompt = no
distinguished_name = req_distinguished_name
req_extensions = v3_req

[req_distinguished_name]
C = BD
ST = BD
L = Dhaka
OU = Software
CN = example.local
emailAddress = admin@example.local

[v3_req]
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = example.local
DNS.2 = www.example.local
IP.1 = 192.168.1.100
EOF
```

```bash
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem -config config.conf
```

```bash
openssl genrsa -out example.local.key 2048
openssl req -new -key example.local.key -out example.local.csr -config config.conf
```

```bash
openssl x509 -req -days 1024 -in example.local.csr -signkey example.local.key -out example.local.crt
```

```bash
sudo cp example.local.csr /etc/ssl/certs
sudo cp example.local.crt /etc/ssl/certs
sudo cp example.local.key /etc/ssl/private
```
