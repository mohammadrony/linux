# OpenProject setup with Apache and PostgreSQL

```sh
sudo hostnamectl set-hostname example.com
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

## Setup PostgreSQL

### Install PostgreSQL 17

```sh
sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo wget -O /etc/apt/trusted.gpg.d/postgresql.asc https://www.postgresql.org/media/keys/ACCC4CF8.asc
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg -
sudo apt update; sudo apt upgrade -y
sudo apt install -y postgresql-17
```

### Update configuration

```sh
sudo cp /etc/postgresql/17/main/postgresql.conf /etc/postgresql/17/main/postgresql.conf.orig
sudo vi /etc/postgresql/17/main/postgresql.conf
```

```conf
listen_addresses = 'localhost'
```

```sh
sudo systemctl restart postgresql
sudo systemctl status postgresql
```

```sh
sudo pg_lsclusters
```

### Create database and user

```sh
sudo -u postgres psql
# sudo -u postgres psql --port 5432
```

```psql
CREATE USER openproject WITH PASSWORD 'openproject24';
ALTER USER openproject WITH SUPERUSER CREATEROLE CREATEDB;

# OR

CREATE ROLE openproject WITH SUPERUSER CREATEROLE CREATEDB LOGIN PASSWORD 'openproject24';
```

```psql
CREATE DATABASE openproject;
ALTER DATABASE openproject OWNER TO openproject;
GRANT ALL PRIVILEGES ON DATABASE openproject TO openproject;
```

```psql
\list
\du+
\q
```

## Setup OpenProject

### Install packages

```sh
sudo apt update
sudo apt install -y apt-transport-https ca-certificates wget net-tools
```

```sh
sudo wget -O /etc/apt/trusted.gpg.d/openproject.asc https://dl.packager.io/srv/opf/openproject/key
```

```sh
sudo wget -O /etc/apt/sources.list.d/openproject.list https://dl.packager.io/srv/opf/openproject/stable/13/installer/ubuntu/22.04.repo
```

```sh
sudo apt update
sudo apt install -y openproject
```

### Openproject configure

```sh
sudo openproject config:set DATABASE_URL="postgresql://openproject:1password1@localhost:5432/openproject"
```

```sh
sudo openproject reconfigure
sudo openproject configure
```

Configure OpenProject with SSL certificate

- Default > OpenProject

- Database
  - reuse > Use an existing PostgreSQL database
  - hostname > 127.0.0.1
  - port > 5432
  - Username > openproject
  - password > <1password1>
  - database > openproject

- Web server
  - install > Install apache2 server
  - fqdn > example.com
  - prefix > /openproject

- SSL
  - no > No
  - API key > openproject
- Subversion
  - skip > Skip
- Git
  - skip > Skip
- memcache
  - install > Install memcache server

## Setup Apache

### SSL Certificate

[Configuring SSL](https://www.openproject.org/docs/installation-and-operations/configuration/ssl/)

### Install Apache certbot

```sh
sudo apt install -y python3-certbot-apache
```

Get SSL Certificates

```sh
sudo certbot certonly --apache
```

### OpenProject reconfigure

- SSL
  - yes > Yes
  - server/ssl_cert > /etc/letsencrypt/live/example.com/fullchain.pem
  - server/ssl_key > /etc/letsencrypt/live/example.com/privkey.pem
  - server/ssl_ca > /etc/letsencrypt/live/example.com/fullchain.pem

Verify Certbot auto renewal

```sh
systemctl list-timers
sudo systemctl status certbot.timer
```

Certificate renew command

```sh
sudo certbot renew --dry-run
```

Update Apache configuration

```sh
sudo cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.orig
sudo echo "ServerName example.com" >> /etc/apache2/apache2.conf
```

```sh
sudo vi /etc/apache2/sites-enabled/openproject.conf
```

```conf
Include /etc/openproject/addons/apache2/includes/server/*.conf
IncludeOptional /etc/openproject/addons/apache2/custom/server/*.conf

<VirtualHost *:80>
  RedirectMatch ^/$ /openproject/
  ProxyPreserveHost On
</VirtualHost>
```

```sh
sudo systemctl restart apache2
sudo systemctl status apache2
```

## Nginx configuration

```conf
include /etc/nginx/openproject/addons/*.conf;

server {
  listen 80;
  listen [::]:80;

  server_name example.com;
  root /opt/openproject/public;

  location ~ / {
    return 301 /openproject;
  }

  location /openproject {
    proxy_pass_request_headers on;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Host $host:$server_port;
    proxy_set_header X-Forwarded-Server $host:$server_port;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_pass http://127.0.0.1:6000/openproject/;

    error_log /var/log/nginx/openproject-error.log;
    access_log /var/log/nginx/openproject-access.log combined;
  }

  location = /favicon.ico {
    log_not_found off;
    access_log off;
  }

  location = /robots.txt {
    log_not_found off;
    access_log off;
  }

  location ~* /\.(?!well-known\/) {
    deny all;
  }
}
```

### Install Nginx certbot

```sh
sudo apt install -y python3-certbot-nginx
```

Get SSL Certificate

```sh
sudo certbot --nginx -d example.com
```

Verify Certbot auto renewal

```sh
systemctl list-timers
sudo systemctl status certbot.timer
```

Certificate renew command

```sh
sudo certbot renew --dry-run
```
