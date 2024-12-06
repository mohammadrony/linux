# Update

Update repository and package

```bash
sudo apt update
sudo apt upgrade -y
```

Update including phased update

```bash
sudo apt update
sudo apt -o APT::Get::Always-Include-Phased-Updates=true -y upgrade
```

## Hold

Hold Upgrade

```bash
sudo apt-mark hold PACKAGE
```

```bash
apt-mark showhold
```

Unhold upgrade

```bash
sudo apt-mark unhold PACKAGE
```

Update package

```bash
sudo apt install -y PACKAGE
```
