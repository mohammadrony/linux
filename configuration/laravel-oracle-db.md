# Laravel with Oracle Database

## Ubuntu

Install PHP

```sh
sudo apt install -y software-properties-common
```

```sh
sudo add-apt-repository -y ppa:ondrej/php
```

```sh
sudo apt install -y php7.4 php7.4-fpm php7.4-common php7.4-cli php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath php7.4-gd php7.4-zip
```

Start PHP7.4-FPM

```sh
sudo systemctl enable --now php7.4-fpm
```

Install SQLplus

Download [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/downloads.html)

```sh
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-basic-linux.x64-19.22.0.0.0dbru.zip -O instantclient-basic-linux.zip
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-sqlplus-linux.x64-19.22.0.0.0dbru.zip -O instantclient-sqlplus-linux.zip
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-sdk-linux.x64-19.22.0.0.0dbru.zip -O instantclient-sdk-linux.zip
```

```sh
sudo mkdir -p /usr/lib/oracle/19.22/client64
```

```sh
sudo unzip -o instantclient-basic-linux.zip -d /usr/lib/oracle/19.22/client64/
sudo unzip -o instantclient-sqlplus-linux.zip -d /usr/lib/oracle/19.22/client64/
sudo unzip -o instantclient-sdk-linux.zip -d /usr/lib/oracle/19.22/client64/
```

```sh
# # Not sure if needed
# wget https://download.oracle.com/otn_software/linux/instantclient/1922000/instantclient-odbc-linux.x64-19.22.0.0.0dbru.zip -O instantclient-odbc-linux.zip

# sudo unzip -o instantclient-odbc-linux.zip -d /usr/lib/oracle/19.22/client64/
```

```sh
cd /usr/lib/oracle/19.22/client64
```

```sh
sudo mv instantclient_19_22 lib
```

```sh
cd lib
sudo ln -sf libclntsh.so.19.1 libclntsh.so
sudo ln -sf libocci.so.19.1 libocci.so
```

```sh
echo '/usr/lib/oracle/19.22/client64/lib' | sudo tee -a /etc/ld.so.conf.d/oracle.conf
```

```sh
sudo ldconfig
```

Install oci8

```sh
sudo apt install -y build-essential php-pear php7.4-dev libaio1 libapache2-mod-php7.4
```

[oci8 install](http://pecl.php.net/package/oci8)

```sh
sudo pecl channel-update pecl.php.net
echo "instantclient,/usr/lib/oracle/19.22/client64/lib" | sudo pecl install oci8-2.2.0 # PHP = 7
```

```sh
echo "extension=oci8.so" | sudo tee -a /etc/php/7.4/fpm/php.ini
echo "extension=oci8.so" | sudo tee -a /etc/php/7.4/cli/php.ini
echo "extension=oci8.so" | sudo tee -a /etc/php/7.4/apache2/php.ini
```

Library path environment setup

```sh
# Update in .bashrc and .zshrc
export LD_LIBRARY_PATH=/usr/lib/oracle/19.22/client64/lib:$LD_LIBRARY_PATH
```

```sh
echo 'LD_LIBRARY_PATH=/usr/lib/oracle/19.22/client64/lib:$LD_LIBRARY_PATH' | sudo tee -a /etc/environment
```

```sh
sudo systemctl restart php7.4-fpm
```

Check status

```sh
php -v
php -m
```

Install composer

```sh
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

```sh
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

```sh
composer
```

```sh
composer install
```

Generate php files

```sh
composer dump-autoload
```

```sh
php artisan optimize
```

Remove PHP

```sh
sudo apt purge "php*"
```

## RHEL

Install PHP

```sh
sudo yum install -y epel-release
sudo yum install -y curl unzip tree
```

```sh
sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm
```

```sh
sudo yum module enable -y php:remi-7.4
```

```sh
sudo yum install -y php php-fpm php-common php-cli php-mbstring php-curl php-xml php-bcmath php-pdo php-gd php-zip
```

Start PHP-FPM

```sh
sudo systemctl enable --now php-fpm
```

Install SQLplus

Download [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/downloads.html)

```sh
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-basic-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-basic.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-sqlplus-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-sqlplus.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-devel-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-devel.rpm
```

```sh
sudo yum install -y oracle-instantclient19.22-basic.rpm
sudo yum install -y oracle-instantclient19.22-sqlplus.rpm
sudo yum install -y oracle-instantclient19.22-devel.rpm
```

```sh
# # Not sure if needed
# wget https://download.oracle.com/otn_software/linux/instantclient/1922000/oracle-instantclient19.22-odbc-19.22.0.0.0-1.x86_64.rpm -O oracle-instantclient19.22-odbc.rpm

# sudo yum install -y oracle-instantclient19.22-odbc.rpm
```

Install oci8

[Installation guide](https://linux.uits.uconn.edu/2020/03/06/php-and-oci8-installation-for-rhel8/)

```sh
sudo yum install -y libnsl php-pear systemtap-sdt-devel
```

```sh
# # Not sure if needed
# sudo dnf config-manager --set-enabled powertools
# sudo yum install -y libedit-devel php-devel gcc curl-devel zlib-devel pcre-devel php-pecl-http
```

```sh
sudo setenforce 0
```

[oci8 install](http://pecl.php.net/package/oci8)

```sh
echo "instantclient,/usr/lib/oracle/19.22/client64/lib" | sudo PHP_DTRACE=yes pecl install oci8-2.2.0 # PHP = 7
```

```sh
sudo su

echo extension=oci8.so >> /etc/php.ini
```

```sh
sudo systemctl restart php-fpm
```

Check status

```sh
php -v
php -m
```

Install composer

```sh
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

```sh
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

```sh
composer
```

```sh
composer install
```

Generate php files

```sh
composer dump-autoload
```

Optimize for production

```sh
php artisan optimize
```

Remove PHP

```sh
sudo yum remove "php*""
```
