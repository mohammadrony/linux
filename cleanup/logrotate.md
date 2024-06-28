# Logrotate

## Install logrotate

```bash
sudo apt install -y logrotate
```

## Tomcat log

Log directory

```bash
sudo mkdir -p /opt/tomcat/logs/archive
sudo chown tomcat:tomcat /opt/tomcat/logs/archive
sudo chmod 755 /opt/tomcat/logs/archive
```

Create rotation config

```bash
sudo vi /etc/logrotate.d/tomcat
```

logrotate for 7 days of uncompressed then 90 days of compressed log

```txt
/opt/tomcat/logs/catalina.out.7
/opt/tomcat/logs/*.log.7
/opt/tomcat/logs/*.txt.7 {
  rotate 90
  missingok
  notifempty
  compress
  dateext
  dateyesterday
  dateformat -%Y-%m-%d
  create 0644 tomcat tomcat
  olddir /opt/tomcat/logs/archive
}

/opt/tomcat/logs/catalina.out
/opt/tomcat/logs/*.log
/opt/tomcat/logs/*.txt {
  daily
  rotate 7
  missingok
  notifempty
  create 0644 tomcat tomcat
  sharedscripts
  postrotate
      /bin/kill -USR1 $(cat /opt/tomcat/temp/tomcat.pid 2>/dev/null) 2>/dev/null || true
  endscript
}
```

Debug or test config file

```bash
sudo logrotate -d /etc/logrotate.d/tomcat
```

Log rotate using command

```bash
sudo logrotate -f /etc/logrotate.d/tomcat
```

## Ghost log

Update log directory permission

```bash
sudo chown root /var/www/*/content/logs
```

```bash
sudo chmod 755 /var/www/*/content/logs
```

Create rotation config

```bash
sudo vi /etc/logrotate.d/ghost
```

logrotate for 30 days compressed

```txt
/var/www/*/content/logs/*.log {
  daily
  rotate 28
  missingok
  compress
  delaycompress
  copytruncate
  notifyempty
  create 0644 ghost ghost
  sharedscripts
  prerotate
    systemctl stop ghost
  endscript
  postrotate
    systemctl start ghost
  endscript
}
```

Debug or test config file

```bash
sudo logrotate -d /etc/logrotate.d/ghost
```

Log rotate using command

```bash
sudo logrotate -f /etc/logrotate.d/ghost
```
