# Installation

## Jenkins

Package

```sh
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install -y jenkins
```

Service

```sh
sudo systemctl daemon-reload
sudo systemctl restart jenkins
```

## Nginx

```sh
sudo apt install -y nginx
```

```sh
sudo tee -a /etc/nginx/sites-available/jenkins.conf << EOF
server {
  listen 80;
  server_name jenkins.example.com;
  access_log /var/log/nginx/jenkins.access.log;
  error_log /var/log/nginx/jenkins.error.log;
  proxy_buffers 16 64k;
  proxy_buffer_size 128k;

  location / {
    proxy_pass http://127.0.0.1:8080;
    proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
    proxy_redirect off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto http;
  }
}
EOF
```

```sh
sudo ln -s /etc/nginx/sites-available/jenkins.conf /etc/nginx/sites-enabled/
sudo nginx -t
```

```sh
sudo systemctl restart nginx
```
