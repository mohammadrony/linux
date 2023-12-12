# Log rotate config

Ghost config

```bash
sudo vi /etc/logrotate.d/ghost.conf
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
  su ghost ghost
}
```
