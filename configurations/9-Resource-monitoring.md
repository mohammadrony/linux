# Linux Resource Monitoring

## Install Sysstat

```bash
sudo apt install -y sysstat
```

```bash
sudo cp /etc/default/sysstat /etc/default/sysstat.orig
sudo sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
```

## Update Cronjob for sysstat

```bash
sudo vi /etc/cron.d/sysstat
```

Update

```cron
5-55/5 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1
```

Restart sysstat service

```bash
sudo systemctl enable --now sysstat
```

### State of the Server

Current state monitoring

```bash
sar -A
```

```bash
sar -u
sar -r
```

```bash
sar -h
```

```bash
sar -A 1 5
```

Time range state monitoring

```bash
sar -A -f /var/log/sysstat/saXX
sar -A -f /var/log/sysstat/saXX -s 00:00:00 -e 23:00:00
```

```bash
sar -A > $(date +`hostname`-%d-%m-%y-%H%M.log)
```
