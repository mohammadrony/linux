# Keycloak and Nginx

## Keycloak

Get version form [release](https://github.com/keycloak/keycloak/releases/).

```sh
KEYCLOAK_VERSION=24.0.4
wget https://github.com/keycloak/keycloak/releases/download/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz
```

## Nginx

```sh
sudo apt install -y nginx
```

```sh
cd /etc/nginx/sites-available
```

```sh
sudo vi sso.example.com.conf
```

```conf
upstream keycloak-backend {
    server 127.0.0.1:8443:
    server 127.0.0.1:4443:
}

server {
    listen 80;
    listen [::]80;

    server_name sso.example.com;
    access_log /var/log/nginx/sso.example.log;
    error_log  /var/log/nginx/sso.example.log error;

    location / {
        include /etc/nginx/proxy_settings.conf;
        proxy_buffer_size   256k;
        proxy_buffers   8 512k;
        proxy_busy_buffers_size   512k;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://keycloak-backend/;
        proxy_set_header Host $http_host;
        proxy_redirect off;
    }
```
