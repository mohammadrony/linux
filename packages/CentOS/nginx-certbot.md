# Nginx and Certbot setup

## Nginx

```bash
sudo dnf install -y nginx
```

```bash
sudo sed '36a \tinclude /etc/nginx/sites-enabled/*.conf;'
```

```bash
cd /etc/nginx/
sudo mkdir sites-available sites-enabled
```

```bash
sudo vi /etc/nginx/sites-available/example.com.conf
```

```conf
server {
  listen 80;
  listen [::]:80;

  server_name example.com;
  access_log /var/log/nginx/example.com.log;
  error_log  /var/log/nginx/example.com.log error;

  location / {
    # Application specific config
  }
}
```

```bash
cd /etc/nginx/sites-enabled/
sudo ln -s example.com.conf ../sites-available/example.com.conf
```

## Certbot

```bash
sudo dnf install -y epel-release
```

```bash
sudo dnf install -y certbot python3-certbot-apache mod_ssl
```

```bash
sudo certbot --nginx -d example.com
```
