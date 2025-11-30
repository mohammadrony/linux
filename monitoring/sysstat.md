# sysstat

## Installation

Debian

```sh
sudo apt install -y sysstat
```

RHEL

```sh
sudo yum install -y sysstat
```

```sh
sudo cp /etc/default/sysstat /etc/default/sysstat.orig
sudo sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
```

## Update timer for sysstat

```sh
sudo vi /etc/cron.d/sysstat
```

Cronjob

```txt
5-55/5 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1
```

System timer

```sh
sudo systemctl edit sysstat-collect.timer
```

```conf
### Editing /etc/systemd/system/sysstat-collect.timer.d/override.conf
### Anything between here and the comment below will become the new contents of the file

[Unit]
Description=Run system activity accounting tool every 5 minutes

[Timer]
OnCalendar=
OnCalendar=*:00/5

[Install]
WantedBy=sysstat.service

### Lines below this comment will be discarded
```

```sh
sudo systemctl daemon-reload
```

Restart sysstat service

```sh
sudo systemctl restart sysstat
```

### State of the Server

Current state monitoring

```sh
sar -h
```

```sh
sar -A
sar -u
sar -r
```

```sh
sar -A 1 5
sar -u 1 5
sar -r 1 5
```

Time range state monitoring

```sh
sar -A -f /var/log/sysstat/saXX
sar -A -f /var/log/sysstat/saXX -s 00:00:00 -e 23:00:00
```

```sh
sar -A > $(date +`hostname`-%d-%m-%y-%H%M.log)
```
