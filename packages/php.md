# PHP Laravel

## PHP Setup

### Ubuntu

```sh
sudo apt install -y software-properties-common
```

```sh
sudo add-apt-repository -y ppa:ondrej/php
```

```sh
N=7.2 # 8 9
sudo apt install -y php$N php$N-fpm
```

```sh
N=7.2 # 8 9
sudo apt install -y php$N-fpm php$N-common php$N-cli php$N-curl php$N-xml
```

```sh
N=7.2 # 8 9
sudo systemctl enable --now php$N-fpm
```

Version check

```sh
php -v
```

Package check

```sh
php -m
```

Remove PHP

```sh
sudo apt remove -y "php*"
```

### RHEL

```sh
N=8 # 9
sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-$N.rpm
```

```sh
N=7.2 # 8 9
sudo yum module enable -y php:remi-$N
```

```sh
sudo yum install -y php
```

HTTPD less installation

```sh
sudo yum install -y php-fpm php-common php-cli php-curl
```

Start PHP-FPM

```sh
sudo systemctl enable --now php-fpm
```

Version check

```sh
php -v
```

Package check

```sh
php -m
```

Remove PHP

```sh
sudo yum remove -y "php*"
```

## Composer

```sh
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

```sh
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

```sh
composer
```
