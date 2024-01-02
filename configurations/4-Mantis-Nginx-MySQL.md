# MantisBT setup with Nginx and MySQL in Ubuntu

Official Guide: <https://www.mantisbt.org/docs/master/en-US/Admin_Guide/html-desktop/#admin.install>
Article: <https://thishosting.rocks/how-to-install-mantisbt-on-ubuntu/>

## Initial server setup

```bash
#!/bin/bash
sudo echo 'mantisbt' > /etc/hostname
sudo apt update; sudo apt -y upgrade
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

Install some base packages

```bash
sudo apt install -y wget vim unzip software-properties-common ca-certificates lsb-release apt-transport-https net-tools
```

## Setup Nginx server

Install Nginx

```bash
sudo apt install -y nginx
```

Start Nginx server

```bash
sudo systemctl enable --now nginx
sudo systemctl status nginx
```

## Setup MySQL server

Install database packages

```bash
sudo apt install -y mysql-server
```

Start MySQL service

```bash
sudo systemctl enable --now mysql
sudo systemctl status mysql
```

Initial MySQL setup

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
> Remove anonymous users? n
> Disallow root login remotely? n
> Remove test database and access to it? n
> Reload privilege tables now? n
```

Update database permission

```bash
sudo mysql
> ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';
> CREATE USER 'mantis'@'localhost' IDENTIFIED BY '12345678';
> FLUSH PRIVILEGES;
> exit
```

Create new database

```bash
sudo mysql -u root -p
> CREATE DATABASE mantisdb;
> GRANT ALL PRIVILEGES ON mantisdb.* TO 'mantis'@'localhost' WITH GRANT OPTION;
> FLUSH PRIVILEGES;
> exit
```

## Install PHP-8

Add Ondrej PPA repository

```bash
LC_ALL=C.UTF-8
sudo add-apt-repository ppa:ondrej/php
sudo apt update
```

Install PHP

```bash
sudo apt install -y php
sudo apt install -y php-fpm php-ldap php-soap php-gd php-curl php-mysqli php-mbstring
```

Check PHP modules

```bash
php -m
```

## Setup MantisBT server

Download MantisBT application

```bash
mantis_version=2.26.0
wget "https://downloads.sourceforge.net/project/mantisbt/mantis-stable/${mantis_version}/mantisbt-${mantis_version}.zip"
unzip mantisbt-${mantis_version}.zip
```

Save MantisBT app in server

```bash
mv -v mantisbt-${mantis_version} /var/www/mantis
sudo chown -R www-data:www-data /var/www/mantis/
sudo chmod -R 755 /var/www/mantis
```

### Setup MantisBT with Nginx

Create new Nginx configuration

```bash
sudo su
cat > /etc/nginx/sites-available/mantis << EOF
server {
  listen 80;
  listen [::]:80;
  root   /var/www/mantis;
  index  index.php index.html index.htm;
  server_name  mantis.example.com;

  access_log /var/log/nginx/mantis-access.log;
  error_log /var/log/nginx/mantis-error.log;

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
```

Update some other Nginx configuration

```bash
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/mantis /etc/nginx/sites-enabled/mantis
sudo systemctl restart nginx
```

### Setup MantisBT with Apache

```bash
sudo apt install -y apache2
```

```bash
cd /etc/apache2/sites-available
sudo rm 000-default.conf
```

```bash
sudo cat > mantisbt << EOF
<VirtualHost *:80>
    ServerName mantis.example.com
    DocumentRoot "/var/www/mantis"

    <Directory "/var/www/mantis/">
        DirectoryIndex index.php index.html
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog "/var/log/apache2/mantis-error.log"
    CustomLog "/var/log/apache2/mantis-access.log" combined
</VirtualHost>
EOF
```

```bash
sudo a2ensite mantisbt
sudo systemctl restart apache2
```

## Final MantisBT configuration

Visit: <http://mantis.example.com/admin/install.php> for initial setup of the application.

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

Visit Login page > Use 'administrator' username > 'root' password > Login.
