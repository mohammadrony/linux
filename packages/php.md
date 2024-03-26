# PHP

## Ubuntu

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
sudo apt install -y php$N # N = 7.2
```

```bash
sudo apt install -y php$N-fpm php$N-common php$N-cli # N = 7.2
```

```bash
sudo systemctl enable --now php-fpm
```

Version check

```bash
php -v
```

## RHEL

```bash
sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-$N.rpm # N = 8
```

```bash
sudo yum module enable -y php:remi-$N # N = 7.2
```

```bash
sudo yum install -y php
```

HTTPD less installation

```bash
sudo yum install -y php-fpm php-common php-cli
```

Start PHP-FPM

```bash
sudo systemctl enable --now php-fpm
```

Version check

```bash
php -v
```
