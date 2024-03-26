# Ubuntu Firewall Configuration

## Setup UFW Firewall

```bash
sudo apt install -y ufw
sudo ufw enable
sudo reboot now
```

## Maintain Firewall rules

List Available Applications

```bash
sudo ufw app list
```

See firewall status

```bash
sudo ufw status
```

```bash
sudo ufw status numbered
```

### Allow port connection

```bash
sudo ufw allow 22/tcp
```

```bash
sudo ufw allow "OpenSSH"
```

Allow connection from selected IP address

```bash
sudo ufw allow from 0.0.0.0 to any port 22
```

### Deny port connection

```bash
sudo ufw deny 22/tcp
```

```bash
sudo ufw deny "OpenSSH"
```

### Delete firewall rules

See firewall status

```bash
sudo ufw status numbered
```

```bash
sudo ufw delete 1
```

```bash
sudo ufw delete allow 22/tcp
```

## Disable Firewall

```bash
sudo ufw disable
```
