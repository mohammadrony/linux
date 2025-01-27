# Remote Desktop

## Ubuntu

Gnome desktop

```bash
sudo apt install -y ubuntu-gnome-desktop
```

RDP server

```bash
sudo apt install -y xrdp
```

```bash
sudo sed -i 's/max_bpp=.*/max_bpp=24/' /etc/xrdp/xrdp.ini
```

```bash
cat /etc/xrdp/xrdp.ini | grep max_bpp
```

Restart service

```bash
sudo systemctl enable xrdp
sudo systemctl restart xrdp
```

## RHEL

Server with GUI

```bash
sudo yum groupinstall -y "Server with GUI"
```

```bash
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```

```bash
sudo systemctl isolate graphical.target
sudo systemctl set-default graphical.target
```

RDP server

```bash
sudo yum install -y xrdp tigervnc-server
```

```bash
sudo sed -i 's/max_bpp=.*/max_bpp=24/' /etc/xrdp/xrdp.ini
```

```bash
cat /etc/xrdp/xrdp.ini | grep max_bpp
```

Restart service

```bash
sudo systemctl enable xrdp
sudo systemctl restart xrdp
```
