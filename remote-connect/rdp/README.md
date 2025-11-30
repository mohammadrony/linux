# Remote Desktop

## Ubuntu

Gnome desktop

```sh
sudo apt install -y ubuntu-gnome-desktop
```

RDP server

```sh
sudo apt install -y xrdp
```

```sh
sudo sed -i 's/max_bpp=.*/max_bpp=24/' /etc/xrdp/xrdp.ini
```

```sh
cat /etc/xrdp/xrdp.ini | grep max_bpp
```

Restart service

```sh
sudo systemctl enable xrdp
sudo systemctl restart xrdp
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

RDP server

```sh
sudo yum install -y xrdp tigervnc-server
```

```sh
sudo sed -i 's/max_bpp=.*/max_bpp=24/' /etc/xrdp/xrdp.ini
```

```sh
cat /etc/xrdp/xrdp.ini | grep max_bpp
```

Restart service

```sh
sudo systemctl enable xrdp
sudo systemctl restart xrdp
```
