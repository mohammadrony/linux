# Update

Update repository and package

```sh
sudo apt update
sudo apt upgrade -y
```

Update including phased update

```sh
sudo apt update
sudo apt -o APT::Get::Always-Include-Phased-Updates=true -y upgrade
```

## Hold

Hold Upgrade

```sh
sudo apt-mark hold PACKAGE
```

```sh
apt-mark showhold
```

Unhold upgrade

```sh
sudo apt-mark unhold PACKAGE
```

Update package

```sh
sudo apt install -y PACKAGE
```
