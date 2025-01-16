# Bugzilla setup with Apache and MySQL

Installation guide: <https://bugzilla.readthedocs.io/en/latest/installing/quick-start.html>

## Initial server setup

Configure server domain name

```bash
sudo apt update; sudo apt upgrade -y
sudo hostnamectl set-hostname example.com
sudo sed -i '/^127.0.0.1\s*localhost/a 127.0.0.1 example.com' /etc/hosts
sudo sysctl kernel.hostname=example.com
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

## Package Installation

Install some base packages

```bash
sudo apt install -y git net-tools tree
```

Install required packages

```bash
sudo apt install -y apache2 build-essential mariadb-server libcgi-pm-perl libdigest-sha-perl libtimedate-perl libdatetime-perl \
  libdatetime-timezone-perl libdbi-perl libdbix-connector-perl libtemplate-perl libemail-address-perl libemail-sender-perl \
  libemail-mime-perl liburi-perl liblist-moreutils-perl libmath-random-isaac-perl libjson-xs-perl libgd-perl libchart-perl \
  libtemplate-plugin-gd-perl libgd-text-perl libgd-graph-perl libmime-tools-perl libwww-perl libxml-twig-perl libnet-ldap-perl \
  libauthen-sasl-perl libnet-smtp-ssl-perl libauthen-radius-perl libsoap-lite-perl libxmlrpc-lite-perl libjson-rpc-perl \
  libtest-taint-perl libhtml-parser-perl libhtml-scrubber-perl libencode-perl libencode-detect-perl libemail-reply-perl \
  libhtml-formattext-withlinks-perl libtheschwartz-perl libdaemon-generic-perl libapache2-mod-perl2 libapache2-mod-perl2-dev \
  libfile-mimeinfo-perl libio-stringy-perl libcache-memcached-perl libfile-copy-recursive-perl libfile-which-perl \
  libdbd-mysql-perl perlmagick lynx graphviz python3-sphinx rst2pdf
```

Add firewall rule

```bash
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw reload
```

## Configure Apache

```bash
cd /etc/apache2/mods-available
sudo cp mpm_event.conf mpm_event.conf.orig
sudo vi mpm_event.conf
```

Update

```conf
<IfModule mpm_event_module>
  StartServers             2
  MinSpareThreads          25
  MaxSpareThreads          75
  ThreadLimit              64
  ThreadsPerChild          25
  MaxRequestWorkers        100
  MaxConnectionsPerChild   0
</IfModule>
```

```bash
cd /etc/apache2
sudo rm sites-enabled/000-default.conf
sudo vi sites-available/bugzilla
```

```bash
<VirtualHost *:80>
  ServerName example.com

  RedirectMatch ^/$ /bugzilla/
  #DocumentRoot /var/www/webapps/bugzilla

  Alias /bugzilla /var/www/webapps/bugzilla
  <Directory /var/www/webapps/bugzilla>
    AddHandler cgi-script .cgi
    Options +ExecCGI
    DirectoryIndex index.cgi index.html
    LimitRequestBody 10485760
    AllowOverride All
  </Directory>

  <IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{HTTP_USER_AGENT} ^-?$ [NC]
    RewriteRule ^.*$ - [R=403,L]
  </IfModule>

  ErrorLog ${APACHE_LOG_DIR}/bugzilla-error.log
  CustomLog ${APACHE_LOG_DIR}/bugzilla-access.log combined
</VirtualHost>
```

Start service

```bash
sudo apachectl configtest
sudo a2ensite bugzilla
sudo a2enmod cgi mpm_event headers expires rewrite
```

```bash
sudo systemctl enable --now apache2
sudo systemctl restart apache2
apache2 -t
```

## Configure MariaDB database

Update MariaDB configuration

```bash
sudo vi /etc/mysql/mariadb.conf.d/50-server.cnf
```

```cnf
max_allowed_packet=100M
ft_min_word_len=2
```

Create new database

```bash
db_pass='1234bz5678'
sudo mysql -u root -e "CREATE DATABASE IF NOT EXISTS bugs CHARACTER SET = 'utf8'"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON bugs.* TO bugs@localhost IDENTIFIED BY '$db_pass'"
```

Restart database service

```bash
sudo systemctl enable --now mariadb
sudo systemctl restart mariadb
```

## Setup Bugzilla app

Download Bugzilla

```bash
sudo mkdir -p /var/www/webapps
cd /var/www/webapps
sudo git clone --branch release-5.0-stable https://github.com/bugzilla/bugzilla bugzilla
```

Check Setup

```bash
cd /var/www/webapps/bugzilla
sudo ./checksetup.pl
```

Edit localconfig file

```bash
cd /var/www/webapps/bugzilla
sudo vi localconfig

# Update
$webservergroup = 'www-data';
$db_pass = '1234bz5678';
```

Check Setup again

```bash
cd /var/www/webapps/bugzilla
sudo ./checksetup.pl
```

User credentials

```txt
Admin-email: user@example.com
Admin-name: <Admin>
Admin-pass: <password>
```

## Setup Certbot

Install certbot

```bash
# Method 1
sudo apt install -y python3-certbot-apache
```

```bash
# Method 2
sudo snap install core
sudo snap refresh core
sudo apt remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

Get SSL Certificate

```bash
sudo certbot --apache -d example.com -d www.example.com
```

Verify Certbot auto renewal

```bash
# Method 1
systemctl list-timers
sudo systemctl status certbot.timer
```

```bash
# Method 2
systemctl list-timers
sudo systemctl status snap.certbot.renew.timer
sudo systemctl status snap.certbot.renew.service
```

Certificate renew command

```bash
sudo certbot renew --dry-run
```

## Browser application from browser

- Visit [Bugzilla Website](https://example.com/bugzilla) from the browser.

- Visit [Bugzilla – Configuration: Required Settings](https://example.com/bugzilla/editparams.cgi) > Add `urlbase: https://example.com/bugzilla/` > Selct `On` for `ssl_redirect` > Add `sslbase: https://example.com/bugzilla/` > Add `cookiepath: /bugzilla/` > Save Changes.

- Visit [Bugzilla – Configuration: Email](https://example.com/bugzilla/editparams.cgi?section=mta) > Select `mail_delivery_method: Sendmail` > Update `mailfrom: Bugzilla<noreply@example.com>` > Save Changes.

Follow [Bugzilla Documentation](https://bugzilla.readthedocs.io/en/latest/index.html) for more information.
