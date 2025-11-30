# Ubuntu Packages

## Could not get lock /var/lib/dpkg/lock-frontend

```sh
sudo killall apt apt-get
```

```sh
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
```

```sh
sudo dpkg --configure -a
```

```sh
sudo apt update
```

```sh
sudo apt install -y PACKAGE
```

## Override to update package

```sh
sudo dpkg -i --force-overwrite /var/cache/apt/archives/PACKAGE_VERSION.deb
```

```sh
sudo apt --fix-broken install
```

```sh
sudo apt upgrade -y
```
