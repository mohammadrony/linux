# Package Install

## Could not get lock /var/lib/dpkg/lock-frontend

```bash
sudo killall apt apt-get
```

```bash
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
```

```bash
sudo dpkg --configure -a
```

```bash
sudo apt update
```

```bash
sudo apt install package_name
```
