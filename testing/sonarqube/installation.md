# Installation

- [Pre-installation steps on Linux systems](https://docs.sonarsource.com/sonarqube-server/latest/setup-and-upgrade/pre-installation/linux/)
- [How to Install SonarQube on Ubuntu](https://www.howtoforge.com/how-to-install-sonarqube-on-ubuntu-22-04/)

## Prerequisites

```bash
sudo vi /etc/sysctl.conf
```

```conf
vm.max_map_count=524288
fs.file-max=131072
```

```bash
sudo sysctl --system
```

```bash
ulimit -n 131072
ulimit -u 8192
```

```bash
sudo vi /etc/security/limits.d/99-sonarqube.conf
```

```conf
*   -   nofile   131072
*   -   nproc    8192
```

## Database

```bash
sudo -i -u postgres psql
```

```bash
CREATE USER sonarqube WITH PASSWORD 'sonarqube';
CREATE DATABASE sonarqube OWNER sonarqube;
GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonarqube;
```

## Sonarqube

```bash
sudo useradd -b /opt/sonarqube -s /bin/bash sonarqube
```

```bash
sudo apt install unzip software-properties-common wget
```

[Download Sonarqube Community Build](https://www.sonarsource.com/products/sonarqube/downloads/success-download-community-edition/)

```bash
unzip sonarqube-*.zip
```

```bash
sudo mv sonarqube-* /opt/
sudo mv /opt/sonarqube-* /opt/sonarqube
```

```bash
sudo chown -R sonarqube:sonarqube /opt/sonarqube
```

```bash
sudo tee -a /opt/sonarqube/conf/sonar.properties << EOF
sonar.jdbc.username=sonarqube
sonar.jdbc.password=sonarqube

sonar.search.javaOpts=-Xmx512m -Xms512m -XX:MaxDirectMemorySize=256m -XX:+HeapDumpOnOutOfMemoryError

sonar.web.host=127.0.0.1
sonar.web.port=9000
sonar.web.javaAdditionalOpts=-server

sonar.log.level=INFO
sonar.path.logs=logs
EOF
```

```bash
sudo tee -a /etc/systemd/system/sonarqube.service << EOF
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonarqube
Group=sonarqube
Restart=always
LimitNOFILE=65536
LimitNPROC=4096

[Install]
WantedBy=multi-user.target
EOF
```

```bash
sudo systemctl daemon-reload
```

```bash
sudo systemctl enable --now sonarqube
sudo systemctl status sonarqube
```

## Nginx

```bash
sudo apt install -y nginx
```

```bash
sudo tee -a /etc/nginx/sites-available/sonarqube.conf << EOF
server {
  listen 80;
  server_name sonar.example.com;
  access_log /var/log/nginx/sonar.access.log;
  error_log /var/log/nginx/sonar.error.log;
  proxy_buffers 16 64k;
  proxy_buffer_size 128k;

  location / {
    proxy_pass http://127.0.0.1:9000;
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

```bash
sudo ln -s /etc/nginx/sites-available/sonarqube.conf /etc/nginx/sites-enabled/
sudo nginx -t
```

```bash
sudo systemctl restart nginx
```
