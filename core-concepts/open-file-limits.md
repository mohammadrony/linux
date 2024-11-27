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
fs.file-max = 65535
```

```conf
# Limit for 32 GB RAM
fs.file-max = 2097152
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
*     soft     nproc      65535
*     hard     nproc      65535
*     soft     nofile     65535
*     hard     nofile     65535
root  soft     nproc      65535
root  hard     nproc      65535
root  soft     nofile     65535
root  hard     nofile     65535
```

```conf
# Limit for 32 GB RAM
*     soft     nproc      131072
*     hard     nproc      131072
*     soft     nofile     524288
*     hard     nofile     524288
root  soft     nproc      131072
root  hard     nproc      131072
root  soft     nofile     524288
root  hard     nofile     524288
```

### System service resources

```bash
sudo vi /etc/systemd/system.conf
```

```conf
# Limit for 8 GB RAM
DefaultLimitNOFILE=65535
DefaultLimitNPROC=65535
```

```conf
# Limit for 32 GB RAM
DefaultLimitNOFILE=524288
DefaultLimitNPROC=131072
```

[Optional] User level system service

```bash
sudo vi /etc/systemd/user.conf
```

```conf
# Limit for 8 GB RAM
DefaultLimitNOFILE=65535
DefaultLimitNPROC=65535
```

```conf
# Limit for 32 GB RAM
DefaultLimitNOFILE=524288
DefaultLimitNPROC=131072
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
sudo reboot
```
