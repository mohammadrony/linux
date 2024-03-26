# PHP Laravel

## PHP Setup

### Ubuntu

```bash
sudo apt install -y software-properties-common
```

```bash
sudo add-apt-repository -y ppa:ondrej/php
```

```bash
sudo apt update
```

```bash
N=7.2 # 8 9
sudo apt install -y php$N php$N-fpm 
```

```bash
N=7.2 # 8 9
sudo apt install -y php$N-fpm php$N-common php$N-cli php$N-curl
```

```bash
N=7.2 # 8 9
sudo systemctl enable --now php$N-fpm
```

Version check

```bash
php -v
```

Package check

```bash
php -m
```

Remove PHP

```bash
sudo apt remove -y "php*"
```

### RHEL

```bash
N=8 # 9
sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-$N.rpm
```

```bash
N=7.2 # 8 9
sudo yum module enable -y php:remi-$N
```

```bash
sudo yum install -y php
```

HTTPD less installation

```bash
sudo yum install -y php-fpm php-common php-cli php-curl
```

Start PHP-FPM

```bash
sudo systemctl enable --now php-fpm
```

Version check

```bash
php -v
```

Package check

```bash
php -m
```

Remove PHP

```bash
sudo yum remove -y "php*"
```

## Composer

```bash
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

```bash
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

```bash
composer
```
