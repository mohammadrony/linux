# Initial OS Setup

## Update default config

```bash
sudo hostnamectl set-hostname <hostname>
```

```bash
sudo timedatectl set-timezone Asia/Dhaka
```

## Basic Packages

```bash
sudo apt install -y build-essential
```

```bash
sudo apt install sysstat -y
sudo systemctl enable --now sysstat
```

```bash
sudo apt install tree
```
