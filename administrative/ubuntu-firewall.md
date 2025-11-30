# Ubuntu Firewall Configuration

## Setup UFW Firewall

```sh
sudo apt install -y ufw
sudo ufw enable
sudo reboot now
```

## Maintain Firewall rules

List Available Applications

```sh
sudo ufw app list
```

See firewall status

```sh
sudo ufw status
```

```sh
sudo ufw status numbered
```

### Allow port connection

```sh
sudo ufw allow 22/tcp
```

```sh
sudo ufw allow "OpenSSH"
```

Allow connection from selected IP address

```sh
sudo ufw allow from 0.0.0.0 to any port 22
```

### Deny port connection

```sh
sudo ufw deny 22/tcp
```

```sh
sudo ufw deny "OpenSSH"
```

### Delete firewall rules

See firewall status

```sh
sudo ufw status numbered
```

```sh
sudo ufw delete 1
```

```sh
sudo ufw delete allow 22/tcp
```

## Disable Firewall

```sh
sudo ufw disable
```
