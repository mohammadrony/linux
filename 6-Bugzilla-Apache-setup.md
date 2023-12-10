# Setup Bugzilla with Apache server in Ubuntu 22

Installation guide: <https://bugzilla.readthedocs.io/en/latest/installing/quick-start.html>

## Initial server setup

### Configure server domain name

```bash
sudo apt -y update; sudo apt -y upgrade
sudo echo 'dev.example.com' > /etc/hostname
sudo sed -i '/^127.0.0.1\s*localhost/a 127.0.0.1\tdev.example.com' /etc/hosts
sudo sysctl kernel.hostname=dev.example.com
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

### Install pre-requisites packages

```bash
sudo apt install -y git net-tools tree
```

## Server Resource Monitoring

### Install Sysstat

```bash
sudo apt install -y sysstat
```

```bash
sudo cp /etc/default/sysstat /etc/default/sysstat.orig
sudo sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
```

### Update Cronjob for sysstat

```bash
sudo vi /etc/cron.d/sysstat
```

Update

```cron
*/5 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1
```

Restart sysstat service

```bash
sudo systemctl enable --now sysstat
```

### State of the Server

Current state monitoring

```bash
sar -A
```

```bash
sar -u
sar -r
```

```bash
sar -u 1 5
```

Time range state monitoring

```bash
sar -u -f /var/log/sysstat/saXX
sar -u -f /var/log/sysstat/saXX -s 00:00:00 -e 23:00:00
```

```bash
sar -A > $(date +`hostname`-%d-%m-%y-%H%M.log)
```

## Setup Apache server

### Install required packages

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

### Add firewall rule

```bash
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw reload
```

### Configure Apache

```bash
sudo cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.orig
sudo vi /etc/apache2/apache2.conf
```

Add

```conf
# RAM: 1 GB, CPU: 1 Thread
ServerName dev.example.com

Timeout 30
<IfModule mpm_event_module>
  KeepAlive               On
  MaxKeepAliveRequests    25
  KeepAliveTimeout        3

  StartServers            2

  ServerLimit             4
  ThreadsPerChild         5
  MaxRequestWorkers       20
  # MaxRequestWorkers = ServerLimit x ThreadsPerChild

  MinSpareThreads         2
  MaxSpareThreads         4
  
  MaxConnectionsPerChild  0
</IfModule>
```

```bash
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo vi /etc/apache2/sites-available/bugzilla.conf
```

Add

```bash
<VirtualHost *:80>
  ServerName dev.example.com

  RedirectMatch ^/$ /bugzilla/
  #DocumentRoot /var/www/webapps/bugzilla

  Alias /bugzilla /var/www/webapps/bugzilla
  <Directory /var/www/webapps/bugzilla>
    AddHandler cgi-script .cgi
    Options +ExecCGI
    DirectoryIndex index.cgi index.html
    LimitRequestBody 20971520
    AllowOverride All
  </Directory>

  ErrorLog ${APACHE_LOG_DIR}/bugzilla-error.log
  CustomLog ${APACHE_LOG_DIR}/bugzilla-access.log combined
</VirtualHost>
```

### Service restart

```bash
sudo apachectl configtest
sudo a2ensite bugzilla
sudo a2enmod cgi mpm_event headers expires rewrite
```

```bash
sudo systemctl enable --now apache2
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

### Create database for Bugzilla

```bash
db_pass='1234bz5678'
sudo mysql -u root -e "CREATE DATABASE IF NOT EXISTS bugs CHARACTER SET = 'utf8'"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON bugs.* TO bugs@localhost IDENTIFIED BY '$db_pass'"
```

### Restart MariaDB service

```bash
sudo systemctl enable --now mariadb
sudo systemctl restart mariadb
```

## Setup Bugzilla application

### Download Bugzilla

```bash
sudo mkdir -p /var/www/webapps
cd /var/www/webapps
sudo git clone --branch release-5.0-stable https://github.com/bugzilla/bugzilla bugzilla
```

Add access rule

```bash
sudo vi bugzilla/.htaccess
```

Add

```htaccess
<IfModule mod_rewrite.c>
  RewriteEngine on
  RewriteCond %{HTTP_USER_AGENT} ^.*Go-http-client.*$ [NC,OR]
  RewriteCond %{HTTP_USER_AGENT} ^.*curl.*$ [NC,OR]
  RewriteCond %{HTTP_USER_AGENT} ^.*python.*$ [NC,OR]
  RewriteCond %{HTTP_USER_AGENT} ^.*java.*$ [NC,OR]
  RewriteCond %{HTTP_USER_AGENT} ^-?$ [NC]
  RewriteRule ^.*$ - [R=403,L]
</IfModule>
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
Admin-email: ashadous.jaman@example.com
Admin-name: Md. Rony
Admin-pass: LSafAMIOftedpaQ1btYC
```

## Setup Certbot

### Install certbot package

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

### Obtain SSL Certificate

```bash
sudo certbot --apache -d example.com -d www.example.com
```

### Verify Certbot auto renewal

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

- Visit [DSi Bugzilla Website](https://dev.example.com/bugzilla) from the browser.

- Visit [Bugzilla – Configuration: Required Settings](https://dev.example.com/bugzilla/editparams.cgi) > Add `urlbase: https://dev.example.com/bugzilla/` > Selct `On` for `ssl_redirect` > Add `sslbase: https://dev.example.com/bugzilla/` > Add `cookiepath: /bugzilla/` > Save Changes.

- Visit [Bugzilla – Configuration: Email](https://dev.example.com/bugzilla/editparams.cgi?section=mta) > Select `mail_delivery_method: Sendmail` > Update `mailfrom: Bugzilla | DSi<noreply@dev.example.com>` > Save Changes.

Follow [Bugzilla Documentation](https://bugzilla.readthedocs.io/en/latest/index.html) for more information.
