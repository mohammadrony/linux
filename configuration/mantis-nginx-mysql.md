# MantisBT setup with Nginx and MySQL

Official Guide: <https://www.mantisbt.org/docs/master/en-US/Admin_Guide/html-desktop/#admin.install>
Article: <https://thishosting.rocks/how-to-install-mantisbt-on-ubuntu/>

## Initial server setup

```sh
#!/bin/bash
sudo hostnamectl set-hostname mantisbt
sudo apt update; sudo apt upgrade -y
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

Install some base packages

```sh
sudo apt install -y wget vim unzip software-properties-common ca-certificates lsb-release apt-transport-https net-tools
```

## Setup Nginx server

Install Nginx

```sh
sudo apt install -y nginx
```

Start Nginx server

```sh
sudo systemctl enable --now nginx
sudo systemctl status nginx
```

## Setup MySQL server

Install database packages

```sh
sudo apt install -y mysql-server
```

Start MySQL service

```sh
sudo systemctl enable --now mysql
sudo systemctl status mysql
```

Initial MySQL setup

```sh
sudo mysql
> UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root';
> SELECT user,authentication_string,plugin,host FROM mysql.user;
> FLUSH PRIVILEGES;
> exit
```

```sh
sudo mysql_secure_installation

> VALIDATE PASSWORD component? y
> Password strength: 0
> Remove anonymous users? n
> Disallow root login remotely? n
> Remove test database and access to it? n
> Reload privilege tables now? n
```

Update database permission

```sh
sudo mysql
```

```mysql
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'PASSWORD';
CREATE USER 'mantis'@'%' IDENTIFIED WITH mysql_native_password BY 'PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

Create new database

```sh
sudo mysql -u root -p
```

```mysql
CREATE DATABASE IF NOT EXISTS mantis_bugs;
GRANT ALL PRIVILEGES ON *.* TO 'mantis'@'%';
FLUSH PRIVILEGES;
```

```sh
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```

```cnf
bind-address = 0.0.0.0
mysqlx-bind-address = 0.0.0.0
```

```sh
sudo systemctl restart mysql
```

## Install PHP-8

Add Ondrej PPA repository

```sh
sudo add-apt-repository -y ppa:ondrej/php
```

Install PHP

```sh
sudo apt install -y php
sudo apt install -y php-fpm php-ldap php-soap php-gd php-curl php-mysqli php-mbstring
```

Check PHP modules

```sh
php -m
```

## Setup MantisBT server

Download MantisBT application

```sh
mantis_version=2.26.0
wget "https://downloads.sourceforge.net/project/mantisbt/mantis-stable/${mantis_version}/mantisbt-${mantis_version}.zip"
unzip mantisbt-${mantis_version}.zip
```

Save MantisBT app in server

```sh
mv -v mantisbt-${mantis_version} /var/www/mantis
sudo chown -R www-data:www-data /var/www/mantis/
sudo chmod -R 755 /var/www/mantis
```

### Setup MantisBT with Nginx

Create new Nginx configuration

```sh
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

```sh
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/mantis /etc/nginx/sites-enabled/mantis
sudo systemctl restart nginx
```

### Setup MantisBT with Apache

```sh
sudo apt install -y apache2
```

```sh
cd /etc/apache2/sites-available
sudo rm 000-default.conf
```

```sh
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

```sh
sudo a2ensite mantisbt
sudo systemctl restart apache2
```

## Final MantisBT configuration

Visit: <http://mantis.example.com/admin/install.php> for initial setup of the application.

### Update database information to web server

- Browse the application from a browser.
- Update database username `mantis`
- Update database password `12345678`
- Update database name `mantis_bugs`
- Update admin username `root`
- Update admin password `12345678`
- Update default time zone `Dhaka`
- Install/Upgrade Database

### Login to dashboard as administrator

Visit Login page > Use 'administrator' username > 'root' password > Login.
