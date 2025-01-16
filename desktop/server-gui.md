# Server GUI

## RHEL

Server with GUI

```bash
sudo yum update -y
```

```bash
sudo yum groupinstall -y "Server with GUI"
```

```bash
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```

```bash
sudo reboot now
```
