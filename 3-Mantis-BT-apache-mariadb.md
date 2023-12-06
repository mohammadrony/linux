# Mantis BT setup in Ubuntu 22 server with Apache + MariaDB

Official Guide: <https://www.mantisbt.org/docs/master/en-US/Admin_Guide/html-desktop/#admin.install>
Article: <https://thishosting.rocks/how-to-install-mantisbt-on-ubuntu/>

## Setup Apache server

### Install base packages

```bash
sudo apt-get install -y wget unzip nano software-properties-common ca-certificates lsb-release apt-transport-https
sudo apt-get install -y apache2
```

### Start Apache server

```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```

## Setup MariaDB server

### Install database packages

```bash
sudo apt-get install -y mariadb-server mariadb-client
sudo mariadb-upgrade
```

### Setup MariaDB service

```bash
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

### Initial MariaDB setup

```bash
sudo mysql_secure_installation
```

Prompt response:

```text
- Password: <Enter>
- Press 'n' to every configuration.
```

### Setup database authentication

```bash
sudo mariadb -u root -p
# or
sudo mysql -u root -p
> Press <Enter>
> GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;
> ALTER USER 'root'@'localhost' IDENTIFIED BY 'new-password';
> FLUSH PRIVILEGES;
> exit
```

## Install PHP-8

### Add Ondrej PPA repository

```bash
LC_ALL=C.UTF-8
sudo add-apt-repository ppa:ondrej/php
sudo apt update -y
```

### Install PHP 8.2 or 7.4

```bash
sudo apt install -y php8.2
sudo apt install -y php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl
```

## Database setup for MantisBT

### Create a database for MantisBT

```bash
sudo mysql -u root -p
> CREATE DATABASE mantisbt;
> CREATE USER 'mantis'@'localhost' IDENTIFIED BY '1234';
> GRANT ALL PRIVILEGES ON *.* TO 'mantis'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;
> FLUSH PRIVILEGES;
> exit
```

## Setup MantisBT server

### Download MantisBT application

```bash
mantis_version=2.25.7
wget "https://downloads.sourceforge.net/project/mantisbt/mantis-stable/${mantis_version}/mantisbt-${mantis_version}.zip"
unzip mantisbt-${mantis_version}.zip
```

### Host MantisBT app to Apache

```bash
mv -v mantisbt-${mantis_version}/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
```

### Update apache configuration

```bash
cd /etc/apache2/sites-available
sudo mv 000-default.conf 000-default.conf.txt
sudo cat > mantisbt.conf << EOF
<VirtualHost *:80>
    ServerName mantisbt.local
    DocumentRoot "/var/www/html"

    <Directory "/var/www/html/">
        DirectoryIndex index.php index.html
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog "/var/log/apache2/mantis-error_log"
    CustomLog "/var/log/apache2/mantis-access_log" combined
</VirtualHost>
EOF
sudo a2ensite mantisbt.conf
sudo systemctl restart apache2
```

## Final MantisBT setup

Visit: <http://mantis-host/admin/install.php> for initial setup of the application.

### Update database information to web server

- Browse the application from a browser.
- Update database username `mantis`
- Update database password `1234`
- Update database name `mantisbt`
- Update admin username `root`
- Update admin password `1234`
- Update default time zone `Dhaka`
- Install/Upgrade Database

### Login to dashboard as administrator

Goto Login page > Use 'administrator' username > 'root' password > Login.
