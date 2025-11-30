# Nginx

## Installation

Ubuntu

```sh
sudo apt install -y nginx
```

RHEL

```sh
sudo dnf install -y nginx
```

## Server setup

```sh
sudo sed '36a \tinclude /etc/nginx/sites-enabled/*.conf;' nginx.conf
```

```sh
cd /etc/nginx/
sudo mkdir sites-available sites-enabled
```

### HTTP Service

```sh
sudo vi /etc/nginx/sites-available/example.com.conf
```

Full config

```sh
server {
  listen 80;
  listen [::]:80;

  server_name example.com www.example.com;
  access_log /var/log/nginx/example-access.log;
  error_log  /var/log/nginx/example-error.log error;

  location / {
    proxy_pass                            http://192.168.0.2:8080;

    # Memory efficient
    proxy_buffer_size                     16k;
    proxy_buffers                         8 32k; # 8 * 32k buffer.
    proxy_busy_buffers_size               64k;

    # More smaller response
    proxy_buffer_size                     128k;
    proxy_buffers                         256 16k; # 256 * 16k buffer.
    proxy_busy_buffers_size               256k;

    # Less but larger response
    proxy_buffer_size                     128k;
    proxy_buffers                         4 256k; # 4 * 256k buffer.
    proxy_busy_buffers_size               256k;

    client_max_body_size                  250m;
    proxy_redirect                        off;

    proxy_set_header Host                 $host;
    proxy_set_header X-Forwarded-For      $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Host     $host;
    proxy_set_header X-Forwarded-Server   $host;
    proxy_set_header X-Forwarded-Proto    $scheme;

    proxy_connect_timeout                 60s;
    proxy_send_timeout                    60s;
    proxy_read_timeout                    60s;

    proxy_cache_use_stale                 error timeout invalid_header updating http_500 http_502 http_503 http_504;
  }
}
```

Single proxy server

```conf
server {
  ...
  ...
  location / {
    proxy_pass          http://192.168.0.2:8080;
  }
}
```

Load balancer

```conf
upstream myapplication {
  server 192.168.0.2:8080;
  server 192.168.0.3:8080;
}

server {
  ...
  ...
  location / {
    proxy_pass          http://myapplication;
  }
}
```

Allow specific ip range

```sh
sudo tee -a /etc/hosts << EOF
192.168.1.101 example.com
EOF
```

```conf
server {
  ...
  server_name example.com
  ...
  ...
  location / {
    deny  192.168.1.1;
    allow 192.168.1.0/24;
    allow 127.0.0.1;
    deny  all;
  }
}
```

Change context path

```conf
server {
  ...
  ...
  location / {
    proxy_pass          http://192.168.0.2:8080;
    rewrite             ^/(.*)$ /$1 break;
  }
}
```

Update url location from `/` to `/path`

```conf
server {
  ...
  ...
  location / {
    rewrite             ^/$ /path redirect;
    proxy_pass          http://192.168.0.2:8080;
  }
}
```

```conf
server {
  ...
  ...
  location = / {
    rewrite             ^/$ /path redirect;
  }

  location / {
    proxy_pass          http://192.168.0.2:8080;
  }
}
```

Redirect to another domain for `/`

```conf
server {
  ...
  ...
  location = / {
    return 301          $scheme://example.com/path;
  }

  location / {
    proxy_pass          http://192.168.0.2:8080;
  }
}
```

```sh
cd /etc/nginx/sites-enabled/
sudo ln -s ../sites-available/example.com.conf example.com.conf
```

### TCP Stream

```sh
sudo vi /etc/nginx/sites-available/example.conf
```

TCP load balancer

```conf
stream {
  upstream myapp {
    server 192.168.0.2:5432;
    server 192.168.0.3:5432;
  }

  server {
    listen 5432;
    proxy_pass myapp;
    proxy_timeout 5m;
    proxy_connect_timeout 5m;
  }
}
```

```sh
cd /etc/nginx/sites-enabled/
sudo ln -s ../sites-available/example.conf example.conf
```

### Reload

Reload service

```sh
sudo nginx -s reload
```

```sh
sudo systemctl restart nginx
```
