# APT Repository

## Repository

Commands

```sh
sudo apt-add-repository --yes REPOSITORY
```

```sh
sudo apt-add-repository --remove --yes REPOSITORY
```

## Ubuntu 22

Add repository

```sh
sudo add-apt-repository -y -s "deb http://archive.ubuntu.com/ubuntu/ jammy main universe"
```

```sh
sudo apt update
```

Remove repository

```sh
sudo add-apt-repository -r -y -s "deb http://archive.ubuntu.com/ubuntu/ jammy main universe"
```

## Upgrade

Upgrade all package

```sh
sudo apt upgrade -y
```

Upgrade specific package

```sh
sudo apt install -y PACKAGE
```

```sh
sudo apt install -y PACKAGE=VERSION*
```
