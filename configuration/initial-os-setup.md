# Initial OS Setup

## Update default config

```bash
sudo hostnamectl set-hostname <hostname>
```

```bash
sudo timedatectl set-timezone Asia/Dhaka
```

## Package install

```bash
sudo apt install -y build-essential
```

```bash
sudo apt install -y sysstat
sudo systemctl enable --now sysstat
```

```bash
sudo apt install -y tree
```
