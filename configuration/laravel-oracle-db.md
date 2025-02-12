# Laravel with Oracle Database

## Ubuntu

Install PHP

```bash
sudo apt install -y software-properties-common
```

```bash
sudo add-apt-repository -y ppa:ondrej/php
```

```bash
sudo apt install -y php7.4 php7.4-fpm php7.4-common php7.4-cli php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath php7.4-gd php7.4-zip
```

Start PHP7.4-FPM

```bash
sudo systemctl enable --now php7.4-fpm
```

Install SQLplus

Download [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/downloads.html)

```bash
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-basic-linux.x64-19.22.0.0.0dbru.zip -O instantclient-basic-linux.zip
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-sqlplus-linux.x64-19.22.0.0.0dbru.zip -O instantclient-sqlplus-linux.zip
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-sdk-linux.x64-19.22.0.0.0dbru.zip -O instantclient-sdk-linux.zip
```

```bash
sudo mkdir -p /usr/lib/oracle/19.22/client64
```

```bash
sudo unzip -o instantclient-basic-linux.zip -d /usr/lib/oracle/19.22/client64/
sudo unzip -o instantclient-sqlplus-linux.zip -d /usr/lib/oracle/19.22/client64/
sudo unzip -o instantclient-sdk-linux.zip -d /usr/lib/oracle/19.22/client64/
```

```bash
# # Not sure if needed
# wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-odbc-linux.x64-19.22.0.0.0dbru.zip -O instantclient-odbc-linux.zip

# sudo unzip -o instantclient-odbc-linux.zip -d /usr/lib/oracle/19.22/client64/
```

```bash
cd /usr/lib/oracle/19.22/client64
```

```bash
sudo mv instantclient_19_22 lib
```

```bash
cd lib
sudo ln -sf libclntsh.so.19.1 libclntsh.so
sudo ln -sf libocci.so.19.1 libocci.so
```

```bash
echo '/usr/lib/oracle/19.22/client64/lib' | sudo tee -a /etc/ld.so.conf.d/oracle.conf
```

```bash
sudo ldconfig
```

Install oci8

```bash
sudo apt install -y build-essential php-pear php7.4-dev libaio1 libapache2-mod-php7.4
```

[oci8 install](http://pecl.php.net/package/oci8)

```bash
sudo pecl channel-update pecl.php.net
echo "instantclient,/usr/lib/oracle/19.22/client64/lib" | sudo pecl install oci8-2.2.0 # PHP = 7
```

```bash
echo "extension=oci8.so" | sudo tee -a /etc/php/7.4/fpm/php.ini
echo "extension=oci8.so" | sudo tee -a /etc/php/7.4/cli/php.ini
echo "extension=oci8.so" | sudo tee -a /etc/php/7.4/apache2/php.ini
```

Library path environment setup

```bash
# Update in .bashrc and .zshrc
export LD_LIBRARY_PATH=/usr/lib/oracle/19.22/client64/lib:$LD_LIBRARY_PATH
```

```bash
echo 'LD_LIBRARY_PATH=/usr/lib/oracle/19.22/client64/lib:$LD_LIBRARY_PATH' | sudo tee -a /etc/environment
```

```bash
sudo systemctl restart php7.4-fpm
```

Check status

```bash
php -v
php -m
```

Install composer

```bash
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

```bash
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

```bash
composer
```

```bash
composer install
```

Generate php files

```bash
composer dump-autoload
```

```bash
php artisan optimize
```

Remove PHP

```bash
sudo apt purge "php*"
```

## RHEL

Install PHP

```bash
sudo yum install -y epel-release
sudo yum install -y curl unzip tree
```

```bash
sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm
```

```bash
sudo yum module enable -y php:remi-7.4
```

```bash
sudo yum install -y php php-fpm php-common php-cli php-mbstring php-curl php-xml php-bcmath php-pdo php-gd php-zip
```

Start PHP-FPM

```bash
sudo systemctl enable --now php-fpm
```

Install SQLplus

Download [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/downloads.html)

```bash
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-basic-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-basic.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-sqlplus-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-sqlplus.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-devel-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-devel.rpm
```

```bash
sudo yum install -y oracle-instantclient19.22-basic.rpm
sudo yum install -y oracle-instantclient19.22-sqlplus.rpm
sudo yum install -y oracle-instantclient19.22-devel.rpm
```

```bash
# # Not sure if needed
# wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-odbc-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-odbc.rpm

# sudo yum install -y oracle-instantclient19.22-odbc.rpm
```

Install oci8

[Installation guide](https://linux.uits.uconn.edu/2020/03/06/php-and-oci8-installation-for-rhel8/)

```bash
sudo yum install -y libnsl php-pear systemtap-sdt-devel
```

```bash
# # Not sure if needed
# sudo dnf config-manager --set-enabled powertools
# sudo yum install -y libedit-devel php-devel gcc curl-devel zlib-devel pcre-devel php-pecl-http
```

```bash
sudo setenforce 0
```

[oci8 install](http://pecl.php.net/package/oci8)

```bash
echo "instantclient,/usr/lib/oracle/19.22/client64/lib" | sudo PHP_DTRACE=yes pecl install oci8-2.2.0 # PHP = 7
```

```bash
sudo su

echo extension=oci8.so >> /etc/php.ini
```

```bash
sudo systemctl restart php-fpm
```

Check status

```bash
php -v
php -m
```

Install composer

```bash
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

```bash
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

```bash
composer
```

```bash
composer install
```

Generate php files

```bash
composer dump-autoload
```

Optimize for production

```bash
php artisan optimize
```

Remove PHP

```bash
sudo yum remove "php*""
```
