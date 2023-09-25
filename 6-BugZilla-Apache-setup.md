# Setup BugZilla with Apache server in Ubuntu 22

## Initial server setup

### Configure server domain name

```bash
sudo apt -y update; sudo apt -y upgrade
sudo echo 'dev.dsinnovators.com' > /etc/hostname
sudo sed -i 's/\(127.0.0.1\).*/\1 dev.dsinnovators.com/' /etc/hosts
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

### Install pre-requisites packages

```bash
sudo apt install -y git nano
```

## Setup Apache server

### Install required packages

```bash
sudo apt install -y apache2 build-essential mariadb-server libcgi-pm-perl libdigest-sha-perl libtimedate-perl libdatetime-perl libdatetime-timezone-perl libdbi-perl libdbix-connector-perl libtemplate-perl libemail-address-perl libemail-sender-perl libemail-mime-perl liburi-perl liblist-moreutils-perl libmath-random-isaac-perl libjson-xs-perl libgd-perl libchart-perl libtemplate-plugin-gd-perl libgd-text-perl libgd-graph-perl libmime-tools-perl libwww-perl libxml-twig-perl libnet-ldap-perl libauthen-sasl-perl libnet-smtp-ssl-perl libauthen-radius-perl libsoap-lite-perl libxmlrpc-lite-perl libjson-rpc-perl libtest-taint-perl libhtml-parser-perl libhtml-scrubber-perl libencode-perl libencode-detect-perl libemail-reply-perl libhtml-formattext-withlinks-perl libtheschwartz-perl libdaemon-generic-perl libapache2-mod-perl2 libapache2-mod-perl2-dev libfile-mimeinfo-perl libio-stringy-perl libcache-memcached-perl libfile-copy-recursive-perl libfile-which-perl libdbd-mysql-perl perlmagick lynx graphviz python3-sphinx rst2pdf
```

### Configure Apache

```bash
sudo vi /etc/apache2/sites-available/bugzilla.conf

# Or
<VirtualHost *:443>
    ServerName dev.dsinnovators.com
    ServerAlias 178.128.113.15

    DocumentRoot /var/www/webapps/bugzilla

    Alias /bugzilla /var/www/webapps/bugzilla

    <Directory /var/www/webapps/bugzilla>
      Options +ExecCGI
      AddHandler cgi-script .cgi
      DirectoryIndex index.cgi index.html
      AllowOverride All
    </Directory>

    ErrorLog /var/log/apache2/bugzilla-https-error.log
    CustomLog /var/log/apache2/bugzilla-https-access.log combined
</VirtualHost>
```

### Service restart

```bash
sudo a2ensite bugzilla
sudo a2enmod cgi headers expires rewrite
sudo systemctl restart apache2
```

## Configure MariaDB database

### Update MariaDB configuration

```bash
sudo vi /etc/mysql/mariadb.conf.d/50-server.cnf

# Update
max_allowed_packet=100M
ft_min_word_len=2
```

### Create database for BugZilla

```bash
db_pass='1234bz5678'
sudo mysql -u root -e "CREATE DATABASE IF NOT EXISTS bugs CHARACTER SET = 'utf8'"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON bugs.* TO bugs@localhost IDENTIFIED BY '$db_pass'"
```

### Restart MariaDB service

```bash
sudo systemctl restart mariadb
```

## Setup BugZilla application

### Download BugZilla

```bash
sudo mkdir -p /var/www/webapps
cd /var/www/webapps
sudo git clone --branch release-5.0-stable https://github.com/bugzilla/bugzilla bugzilla
```

### Check Setup

```bash
cd /var/www/webapps/bugzilla
sudo ./checksetup.pl
```

### Edit localconfig file

```bash
cd /var/www/webapps/bugzilla
sudo vi localconfig

# Update
$webservergroup = 'www-data';
$db_pass = '1234bz5678';
```

### Check Setup again

```bash
cd /var/www/webapps/bugzilla
sudo ./checksetup.pl

# User credentials
Admin-email: ashadous.jaman@dsinnovators.com
Admin-pass: bugzilla
```

## Setup Certbot

### Install certbot package

```bash
sudo apt install -y certbot python3-certbot-apache
```

### Obtain SSL Certificate

```bash
sudo certbot --apache
> ashadous.jaman@dsinnovators.com
> y
> n
> 1
```

### Verify Certbot auto renewal

```bash
sudo systemctl status certbot.timer
sudo certbot renew --dry-run
```

## Browser application from browser

- Visit [DSi BugZilla Website](https://dev.dsinnovators.com/bugzilla) from your browser.
- Goto [Bugzilla – Configuration: Required Settings](https://dev.dsinnovators.com/bugzilla/editparams.cgi) > Selct 'On' for ssl_redirect > Save Changes.
- Goto [Bugzilla – Configuration: Email](https://dev.dsinnovators.com/bugzilla/editparams.cgi?section=mta) > Select `mail_delivery_method: SMTP` > Select `mailfrom: rony@dev.dsinnovators.com` > Select `smtp_username: rony` > Select `smtp_password: pass` > Select `smtp_ssl: Off`

Thank you.
