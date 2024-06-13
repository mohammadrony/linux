# Nginx

## Installation

Ubuntu

```bash
sudo apt install -y nginx
```

RHEL

```bash
sudo dnf install -y nginx
```

## Server setup

```bash
sudo sed '36a \tinclude /etc/nginx/sites-enabled/*.conf;' nginx.conf
```

```bash
cd /etc/nginx/
sudo mkdir sites-available sites-enabled
```

```bash
sudo vi /etc/nginx/sites-available/example.com.conf
```

Example 1

```conf
server {
  listen 80;
  listen [::]:80;

  server_name example.com;
  access_log /var/log/nginx/example.com.log;
  error_log  /var/log/nginx/example.com.log error;

  location / {
    proxy_pass  http://192.168.0.101:8080;
    # Application specific config
  }
}
```

Example 2

```conf
upstream myapplication {
  server 192.168.0.101:8080;
  server 192.168.0.102:8080;
}

server {
  listen 80;
  listen [::]:80;

  server_name example.com;
  access_log /var/log/nginx/example.com.log;
  error_log  /var/log/nginx/example.com.log error;

  location / {
    proxy_buffer_size                     128k;
    proxy_buffers                         4 256k;
    proxy_busy_buffers_size               256k;
    client_max_body_size                  250m;
    proxy_redirect                        off;
    proxy_pass                            http://myapplication;
    rewrite                               ^/(.*)$ /$1 break;
    proxy_set_header Host                 $host;
    proxy_set_header X-Forwarded-For      $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Host     $host;
    proxy_set_header X-Forwarded-Server   $host;
    proxy_set_header X-Forwarded-Proto    $scheme;
  }
}
```

```bash
cd /etc/nginx/sites-enabled/
sudo ln -s ../sites-available/example.com.conf example.com.conf
```

```bash
sudo systemctl restart nginx
```

To use certbot for SSL certificate follow [certbot](./certbot.md) file.
