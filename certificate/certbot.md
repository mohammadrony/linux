# Certbot

## Installation

Snap

```sh
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

Ubuntu

```sh
sudo apt install -y certbot python3-certbot-nginx # python3-certbot-apache
```

RHEL

```sh
sudo dnf install -y epel-release
```

```sh
sudo dnf install -y certbot python3-certbot-nginx mod_ssl # python3-certbot-apache
```

Amazon Linux 2023

```sh
sudo dnf install -y augeas-libs
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot certbot-nginx # certbot-apache
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
```

Service setup

```sh
sudo tee -a /usr/lib/systemd/system/certbot-renew.service << EOF
[Unit]
Description=This service automatically renews any certbot certificates found

[Service]
EnvironmentFile=/etc/sysconfig/certbot
Type=oneshot
ExecStart=/usr/bin/certbot renew --noninteractive --no-random-sleep-on-renew
EOF
```

```sh
sudo tee -a /usr/lib/systemd/system/certbot-renew.timer << EOF
[Unit]
Description=This is the timer to set the schedule for automated renewals

[Timer]
OnCalendar=*-*-* 00/12:00:00
RandomizedDelaySec=12hours
Persistent=true

[Install]
WantedBy=timers.target
EOF
```

```sh
sudo systemctl enable --now certbot-renew.timer certbot-renew.service
```

## Usage

Nginx

```sh
sudo certbot --nginx -d example.com -d www.example.com
```

```sh
sudo certbot --apache -d example.com -d www.example.com
```

```sh
sudo su

cd /etc/letsencrypt/live/www.example.com/
ln -s cert.pem /opt/tomcat/conf/
ln -s chain.pem /opt/tomcat/conf/
ln -s privkey.pem /opt/tomcat/conf/
chmod 644 /opt/tomcat/conf/*.pem
```

Certificate auto renewal service

```sh
# apt or dnf install
systemctl list-timers
sudo systemctl status certbot-renew.timer
sudo systemctl status certbot-renew.service
```

```sh
# snap install
systemctl list-timers
sudo systemctl status snap.certbot.renew.timer
sudo systemctl status snap.certbot.renew.service
```

Renew certificate command

```sh
sudo certbot renew --dry-run
```

Generate certificate only

```sh
sudo certbot certonly -d www.example.com
```

```sh
sudo certbot certonly --nginx -d www.example.com
sudo certbot certonly --standalone -d www.example.com
```

List certificates

```sh
sudo certbot certificates
```

Delete domain and certificates

```sh
sudo certbot delete --cert-name www.example.com
```
