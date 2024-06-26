# Certbot

## Installation

Snap

```bash
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

Ubuntu

```bash
sudo apt install -y certbot python3-certbot-nginx # python3-certbot-apache
```

RHEL

```bash
sudo dnf install -y epel-release
```

```bash
sudo dnf install -y certbot python3-certbot-nginx mod_ssl # python3-certbot-apache
```

## Usage

```bash
sudo certbot --nginx -d example.com -d www.example.com
```

```bash
sudo certbot --apache -d example.com -d www.example.com
```

Certificate auto renewal service

```bash
# apt or dnf install
systemctl list-timers
sudo systemctl status certbot.timer
```

```bash
# snap install
systemctl list-timers
sudo systemctl status snap.certbot.renew.timer
sudo systemctl status snap.certbot.renew.service
```

Renew certificate command

```bash
sudo certbot renew --dry-run
```
