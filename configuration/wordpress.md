# WordPress

Installation tutorial

- [Install and configure WordPress](https://ubuntu.com/tutorials/install-and-configure-wordpress)
- [Install WordPress with PostgreSQL](https://medium.com/@shoaibhassan_/install-wordpress-with-postgresql-using-apache-in-5-min-a26078d496fb)
- []

LAMP Stack

```bash
sudo apt update
sudo apt install -y apache2 ghostscript libapache2-mod-php mysql-server
```

```bash
sudo apt install -y php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip php-cli php-fpm php-opcache php-gd
```

Application

```bash
cd /var/www/
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo rm -rf latest.tar.gz
```

Apache Config

Postgresql Config

```bash
sudo -i -u postgres psql
```

```psql
create database wordpress;
create user wordpress with password 'wordpress1234';
grant all privileges on database wordpress to wordpress;
\q
```

```bash
cd /var/www/wordpress/wp-content
sudo git clone https://github.com/kevinoid/postgresql-for-wordpress.git
sudo mv postgresql-for-wordpress/pg4wp Pg4wp
sudo rm -rf postgresql-for-wordpress
sudo cp Pg4wp/db.php db.php
```

```bash
cd /var/www/wordpress
sudo cp wp-config-sample.php wp-config.php
```

Nginx Config

```bash
cd /var/www/html
sudo chown www-data: wordpress/ -R
```

```conf
sudo tee /etc/nginx/sites-available/wordpress.conf << EOF
server {
    listen 80;
    listen [::]:80;

    server_name example.com www.example.com;
    access_log /var/log/nginx/example-access.log;
    error_log  /var/log/nginx/example-error.log error;

    root /var/www/html/wordpress;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    }
    
    location ~ /\.ht {
        deny all;
    }

    location = /favicon.ico {
        log_not_found off;
        access_log off;
    }

    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
        expires max;
        log_not_found off;
    }
}
EOF
```

```bash
cd ../sites-enabled/
sudo ln -s ../sites-available/wordpress.conf ./
``

```bash
sudo systemctl reload nginx
```
