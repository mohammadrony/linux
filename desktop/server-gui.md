# Server GUI

## Ubuntu

Gnome desktop

```sh
sudo apt install -y ubuntu-gnome-desktop
```

## RHEL

Server with GUI

```sh
sudo yum groupinstall -y "Server with GUI"
```

```sh
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```

```sh
sudo systemctl isolate graphical.target
sudo systemctl set-default graphical.target
```
