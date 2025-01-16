# APT Repository

## Repository

Commands

```bash
sudo apt-add-repository --yes REPOSITORY
```

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
sudo apt upgrade -y
```

Upgrade specific package

```bash
sudo apt install -y PACKAGE
```

```bash
sudo apt install -y PACKAGE=VERSION*
```
