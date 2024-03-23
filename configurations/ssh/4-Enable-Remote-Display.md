# Enable Remote Display

## Server side setup

```bash
sudo vi /etc/ssh/sshd_config
```

Update

```sshd_config
X11Forwarding yes
X11UseLocalhost no
X11DisplayOffset 10
```

Reload SSH

```bash
sudo systemctl daemon-reload
sudo systemctl restart sshd
```

## Client side setup

```bash
xhost + host
```

```bash
ssh -X grid@host
```
