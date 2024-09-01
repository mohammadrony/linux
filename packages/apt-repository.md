# APT Repository

## Add Repository

Add

```bash
sudo apt-add-repository --yes REPOSITORY

```

Remove

```bash
sudo apt-add-repository --remove --yes REPOSITORY
```

## Ubuntu 22

Add repository

```bash
sudo add-apt-repository -y -s "deb http://archive.ubuntu.com/ubuntu/ jammy main universe"
```

```bash
sudo apt update
```

Remove repository

```bash
sudo add-apt-repository -r -y -s "deb http://archive.ubuntu.com/ubuntu/ jammy main universe"
```

## Upgrade

Upgrade all package

```bash
sudo apt -y upgrade
```

Upgrade specific package

```bash
sudo apt install -y PACKAGE
```

```bash
sudo apt install -y PACKAGE=VERSION*
```
