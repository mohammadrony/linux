# Keycloak with Postgresql Database

## Install Packages

```bash
sudo apt install -y openjdk-17-jdk openjdk-17-jre
```

```bash
# Update ~/.bashrc and ~/.zshrc
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH=$PATH:$JAVA_HOME/bin
```

Find latest keycloak version from [here](https://github.com/keycloak/keycloak/releases/).

```bash
VERSION=23.0.6
wget https://github.com/keycloak/keycloak/releases/download/$VERSION/keycloak-$VERSION.tar.gz -O keycloak-$VERSION.tar.gz
tar -xvf keycloak-$VERSION.tar.gz
sudo mv keycloak-$VERSION /opt/keycloak
```

Setup keycloak files

```bash
cd /opt

sudo groupadd keycloak
sudo useradd -r -g keycloak -d /opt/keycloak -s /sbin/nologin keycloak

sudo chown -R keycloak:keycloak keycloak
sudo chmod o+x /opt/keycloak/bin
```

## Keycloak service setup

Create a service in the system

```bash
cd /etc/systemd/system
sudo vi keycloak.service
```

```service
[Unit]
Description=Keycloak Authorization Server
After=network.target

[Service]
User=keycloak
Group=keycloak
ExecStart=/opt/keycloak/bin/kc.sh start


ExecStop=/opt/keycloak/bin/kc.sh stop
Restart=always
RestartSec=3
Environment="JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64"
[Install]
WantedBy=multi-user.target
```

Start keycloak service

```bash
sudo systemctl daemon-reload
sudo systemctl start keycloak.service
sudo systemctl status keycloak.service
```

## Database setup

```bash
sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo wget -O /etc/apt/trusted.gpg.d/postgresql.asc https://www.postgresql.org/media/keys/ACCC4CF8.asc
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg -
sudo apt update; sudo apt -y upgrade
sudo apt install -y postgresql-16
```

### Update configuration

Allow external server connection

```bash
sudo cp /etc/postgresql/16/main/postgresql.conf /etc/postgresql/16/main/postgresql.conf.orig
sudo vi /etc/postgresql/16/main/postgresql.conf
```

```conf
listen_addresses = '*'
```

```bash
sudo systemctl restart postgresql
sudo systemctl status postgresql
```

```bash
sudo pg_lsclusters
```

```bash
sudo -i -u postgres psql
```

```psql
CREATE USER keycloak WITH PASSWORD 'keycloak24';
ALTER USER keycloak WITH SUPERUSER CREATEROLE CREATEDB;
```

```psql
CREATE DATABASE keycloak;
ALTER DATABASE keycloak OWNER TO keycloak;
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
\q
```

## Keycloak configuration

```bash
sudo vi /opt/keycloak/conf/keycloak.conf
```

```conf
proxy=edge
http-relative-path=/auth
hostname-path=/auth

db=postgres
db-url=postgres://keycloak:keycloak24@localhost:5432/keycloak
hostname-strict=false

http-enabled=true
http-host=127.0.0.1
http-port=8080

log=file
log-file=/var/log/keycloak.log
```

```bash
sudo /opt/keycloak/bin/kc.sh build
```

Restart keycloak service

```bash
sudo systemctl daemon-reload
sudo systemctl restart keycloak
```

Apache proxy configuration

```bash
sudo vi /etc/apache2/sites-available/keycloak.conf
```

```conf
<VirtualHost *:443>
  ServerAdmin admin@example.com
  DocumentRoot /var/www/html

  LogLevel Info
  ServerSignature Off
  HostnameLookups Off
  UseCanonicalName Off
  ProxyPreserveHost On

  RequestHeader set "X-Forwarded-Proto" "https"
  RequestHeader set "X-Forwarded-Port" "443"
  RequestHeader set x-ssl-client-cert "%{SSL_CLIENT_CERT}s"

  ProxyPass /auth http://localhost:8443/auth
  ProxyPassReverse /auth http://localhost:8443/auth
  ProxyRequests Off

  ErrorLog ${APACHE_LOG_DIR}/keycloak-error.log
  CustomLog ${APACHE_LOG_DIR}/keycloak-access.log combined

  SSLCertificateFile /etc/letsencrypt/live/sso.example.com/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/sso.example.com/privkey.pem
  Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
```

Enable keycloak proxy service

```bash
sudo apachectl configtest
sudo a2ensite keycloak
sudo systemctl reload apache2
```
