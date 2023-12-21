# Log Rotate config

## Ghost log

Install package

```bash
sudo apt install -y logrotate
```

Update log directory permission

```bash
sudo chown root /var/www/*/content/logs
```

```bash
sudo chmod 755 /var/www/*/content/logs
```

Create Ghost config

```bash
sudo vi /etc/logrotate.d/ghost
```

```conf
/var/www/*/content/logs/*.log {
  daily
  rotate 28
  missingok
  compress
  delaycompress
  copytruncate
  notifyempty
  create 0640 ghost ghost
  sharedscripts
  prerotate
    systemctl stop ghost
  endscript
  postrotate
    systemctl start ghost
  endscript
}
```

Debug config file

```bash
sudo logrotate -d /etc/logrotate.d/ghost
```

Force log rotate

```bash
sudo logrotate -f /etc/logrotate.d/ghost
```
