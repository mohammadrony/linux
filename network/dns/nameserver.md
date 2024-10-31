# Nameserver

```bash
sudo cp /etc/systemd/resolved.conf /etc/systemd/resolved.conf.orig
sudo vi /etc/systemd/resolved.conf
```

Update

```conf
[Resolve]
DNS=8.8.8.8 8.8.4.4
```

Reload configuration

```bash
sudo systemctl restart systemd-resolved
```

Test settings

```bash
resolvectl status
```
