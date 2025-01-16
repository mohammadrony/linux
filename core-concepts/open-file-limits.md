# Open File Limits

- Default configuration is for 2-4 GB RAM.
- Increase limits for "too many open files" error.
- Limit varies for available RAM and CPU.
- Running Containers, Database server needs to increase limit.

## Configuration

### System wide configuration

```bash
sudo vi /etc/sysctl.conf
```

```conf
# Limit for 8 GB RAM
# /etc/sysctl.conf
fs.nr_open=65536
fs.file-max=65536
net.core.somaxconn=16384
net.core.netdev_max_backlog=16384
net.ipv4.tcp_max_syn_backlog=16384
fs.inotify.max_user_watches=65536
```

```conf
# Limit for 16 GB RAM
fs.nr_open=131072
fs.file-max=131072
net.core.somaxconn=32768
net.core.netdev_max_backlog=32768
net.ipv4.tcp_max_syn_backlog=32768
fs.inotify.max_user_watches=131072
```

```conf
# Limit for 32 GB RAM
fs.nr_open=262144
fs.file-max=262144
net.core.somaxconn=65535
net.core.netdev_max_backlog=65536
net.ipv4.tcp_max_syn_backlog=65536
fs.inotify.max_user_watches=262144
```

```bash
sudo sysctl -p
```

### Process resource limits

```bash
sudo vi /etc/security/limits.conf
```

```conf
# Limit for 8 GB RAM
*     soft     nproc      32768
*     hard     nproc      32768
*     soft     nofile     32768
*     hard     nofile     32768
root  soft     nproc      32768
root  hard     nproc      32768
root  soft     nofile     32768
root  hard     nofile     32768
```

```conf
# Limit for 16 GB RAM
*     soft     nproc      65535
*     hard     nproc      65535
*     soft     nofile     65535
*     hard     nofile     65535
root  soft     nproc      65535
root  hard     nproc      65535
root  hard     nofile     65535
root  soft     nofile     65535
```

```conf
# Limit for 32 GB RAM
*     soft     nproc      131072
*     hard     nproc      131072
*     soft     nofile     131072
*     hard     nofile     131072
root  soft     nproc      131072
root  hard     nproc      131072
root  soft     nofile     131072
root  hard     nofile     131072
```

### System service resources

```bash
sudo vi /etc/systemd/system.conf
```

```conf
# Limit for 8 GB RAM
DefaultLimitNOFILE=32768
DefaultLimitNPROC=32768
# DefaultTasksMax=32768
```

```conf
# Limit for 16 GB RAM
DefaultLimitNOFILE=65535
DefaultLimitNPROC=65535
# DefaultTasksMax=65535
```

```conf
# Limit for 32 GB RAM
DefaultLimitNOFILE=131072
DefaultLimitNPROC=131072
# DefaultTasksMax=131072
```

[Optional] User level system service

```bash
sudo vi /etc/systemd/user.conf
```

```conf
# Limit for 8 GB RAM
DefaultLimitNOFILE=32768
DefaultLimitNPROC=32768
# DefaultTasksMax=32768
```

```conf
# Limit for 16 GB RAM
DefaultLimitNOFILE=65535
DefaultLimitNPROC=65535
# DefaultTasksMax=65535
```

```conf
# Limit for 32 GB RAM
DefaultLimitNOFILE=131072
DefaultLimitNPROC=131072
# DefaultTasksMax=131072
```

### Limit apply in new session

```bash
sudo vi /etc/pam.d/common-session
```

Add

```conf
session required pam_limits.so
```

```bash
sudo vi /etc/pam.d/common-session-noninteractive
```

Add

```conf
session required pam_limits.so
```

## Apply Configuration

Daemon reload

```bash
sudo systemctl daemon-reload
```

Restart services

```bash
sudo systemctl restart <service-name>
```

Reload login session

```bash
sudo systemctl restart systemd-logind
# exec su -l $USER
```

Restart

```bash
sudo reboot now
```

## Check Status

Kernel parameters

```bash
sysctl -a
```

```bash
sysctl fs.file-max
```

System configuration

```bash
systemctl show
```

```bash
systemctl show --property DefaultLimitNPROC
systemctl show --property DefaultLimitNOFILE
```
