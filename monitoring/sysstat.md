# sysstat

## Installation

Debian

```bash
sudo apt install -y sysstat
```

RHEL

```bash
sudo yum install -y sysstat
```

```bash
sudo cp /etc/default/sysstat /etc/default/sysstat.orig
sudo sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
```

## Update timer for sysstat

```bash
sudo vi /etc/cron.d/sysstat
```

Cronjob

```txt
5-55/5 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1
```

System timer

```bash
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

```bash
sudo systemctl daemon-reload
```

Restart sysstat service

```bash
sudo systemctl enable --now sysstat
```

### State of the Server

Current state monitoring

```bash
sar -h
```

```bash
sar -A
sar -u
sar -r
```

```bash
sar -A 1 5
sar -u 1 5
sar -r 1 5
```

Time range state monitoring

```bash
sar -A -f /var/log/sysstat/saXX
sar -A -f /var/log/sysstat/saXX -s 00:00:00 -e 23:00:00
```

```bash
sar -A > $(date +`hostname`-%d-%m-%y-%H%M.log)
```
