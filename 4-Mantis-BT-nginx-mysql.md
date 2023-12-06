# Mantis BT setup in Ubuntu 22 server with Nginx + MySQL

Official Guide: <https://www.mantisbt.org/docs/master/en-US/Admin_Guide/html-desktop/#admin.install>

## Create Ubuntu 22 server in Cloud or VM

```bash
#!/bin/bash
sudo echo 'mantisbt' > /etc/hostname
sudo apt -y update; sudo apt -y upgrade
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

## Setup Nginx server

### Install base packages

```bash
sudo apt install -y wget vim unzip software-properties-common ca-certificates \
 lsb-release apt-transport-https
sudo apt install -y nginx
```

### Start Nginx server

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
```

## Setup MySQL server

### Install database packages

```bash
sudo apt install -y mysql-server
```

### Setup MySQL service

```bash
sudo systemctl start mysql
sudo systemctl enable mysql
sudo systemctl status mysql
```

### Initial MySQL setup

```bash
sudo mysql
> UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root';
> SELECT user,authentication_string,plugin,host FROM mysql.user;
> FLUSH PRIVILEGES;
> exit
```

```bash
sudo mysql_secure_installation

> VALIDATE PASSWORD component? y
> Password strength: 0
> Remove anonymous users? y
> Disallow root login remotely? y
> Remove test database and access to it? y
> Reload privilege tables now? y
```

### Setup database access

```bash
sudo mysql
> ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';
> CREATE USER 'mantis'@'localhost' IDENTIFIED BY '12345678';
> GRANT ALL PRIVILEGES ON mantisdb.* TO 'mantis'@'localhost' WITH GRANT OPTION;
> FLUSH PRIVILEGES;
> exit;
```

### Create Mantis database

```bash
sudo mysql -u root -p
> CREATE DATABASE mantisdb;
> exit;
```

## Install PHP-8

### Add Ondrej PPA repository

```bash
LC_ALL=C.UTF-8
sudo add-apt-repository ppa:ondrej/php
sudo apt -y update
```

### Install PHP

```bash
sudo apt install -y php
sudo apt install -y php-fpm php-ldap php-soap php-gd php-curl php-mysqli \
 php-mbstring
```

### Check PHP installed modules

```bash
php -m
```

## Setup MantisBT server

### Download MantisBT application

```bash
mantis_version=2.25.7
wget "https://downloads.sourceforge.net/project/mantisbt/mantis-stable/\
${mantis_version}/mantisbt-${mantis_version}.zip"
unzip mantisbt-${mantis_version}.zip
```

### Host MantisBT app to Apache

```bash
mv -v mantisbt-${mantis_version} /var/www/mantis
sudo chown -R www-data:www-data /var/www/mantis/
sudo chmod -R 755 /var/www/mantis
```

### Update default Nginx page config

Change server port from 80 to any other port in `/etc/nginx/sites-enabled/default` file.

```bash
sudo sed -i "s/\(.*\)80 \(.*\)/\181 \2/" /etc/nginx/sites-enabled/default
```

### Update Nginx configuration

```bash
sudo su
cd /etc/nginx/sites-available/
cat > mantis << EOF
server {
  listen 80;
  listen [::]:80;
  root   /var/www/mantis;
  index  index.php index.html index.htm;
  server_name  mantis.example.com;
 
  access_log /var/log/nginx/mantis.com.access.log;
  error_log /var/log/nginx/mantis.com.error.log;

  client_max_body_size 100M;

  location / {
    index index.php index.html;
    try_files $uri /index.php$is_args$args;
  }

  location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
    include fastcgi_params;
    fastcgi_intercept_errors on;
  }
}
EOF
sudo ln -s /etc/nginx/sites-available/mantis /etc/nginx/sites-enabled/mantis
sudo systemctl restart nginx
```

## Final MantisBT setup

Visit: <http://mantis-host/admin/install.php> for initial setup of the application.

### Update database information to web server

- Browse the application from a browser.
- Update database username `mantis`
- Update database password `12345678`
- Update database name `mantisdb`
- Update admin username `root`
- Update admin password `12345678`
- Update default time zone `Dhaka`
- Install/Upgrade Database

### Login to dashboard as administrator

Continue to Login page > Use 'administrator' username > 'root' password > Login.
