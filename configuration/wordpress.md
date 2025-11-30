# WordPress

Installation notes

- [Install and configure WordPress](https://ubuntu.com/tutorials/install-and-configure-wordpress)
- [How to install and configure WordPress with NGINX](https://www.ionos.com/digitalguide/hosting/blogs/wordpress-nginx/)
- [PG4WP broken with php-8.x for Postgresql](https://wordpress.org/support/topic/completely-broken-with-php-8-x/)

## PHP

```sh
sudo apt update
```

```sh
sudo apt install -y php ghostscript php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip php-cli php-fpm php-opcache php-gd
```

```sh
sudo systemctl enable --now php-fpm
sudo systemctl status php-fpm
```

## MySQL

```sh
sudo apt install -y mysql-server
```

```sh
sudo mysql -u root -p
```

```sql
CREATE DATABASE wordpressdb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

```sql
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_password'
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wp_user'@'localhost'
```

## Application

```sh
cd /var/www/
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo rm -rf latest.tar.gz
```

```sh
sudo chown -R www-data: /var/www/wordpress/
```

```sh
cd /var/www/wordpress
sudo cp wp-config-sample.php wp-config.php
```

```sh
sudo sed -i 's/database_name_here/wordpressdb/' wp-config.php
sudo sed -i 's/username_here/wp_user/' wp-config.php
sudo sed -i 's/password_here/wp_password/' wp-config.php
sudo sed -i 's/localhost/localhost/' wp-config.php
```

## Nginx

```sh
sudo apt install -y nginx
```

```conf
sudo tee /etc/nginx/sites-available/wordpress.conf << EOF
server {
    listen 80;
    listen [::]:80;

    server_name example.com www.example.com;
    access_log /var/log/nginx/wordpress-access.log;
    error_log  /var/log/nginx/wordpress-error.log error;

    root /var/www/wordpress;
    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$args;
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

    location ~ \.php$ {
       include snippets/fastcgi-php.conf;
       fastcgi_pass unix:/var/run/php/php-fpm.sock;
       fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
       include fastcgi_params;
    }
}
EOF
```

```sh
cd ../sites-enabled/
sudo ln -s ../sites-available/wordpress.conf ./
``

```sh
sudo systemctl reload nginx
```

Certificate

```sh
sudo apt install -y certbot python3-certbot-nginx
```

```sh
sudo certbot --nginx -d www.example.com
```

## Browse Application

Open [wordpress](www.example.com) from browser.
