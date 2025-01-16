# Remote Desktop

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
sudo systemctl enable --now xrdp
```

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
cat /etc/xrdp/xrdp.ini
```

```bash
sudo systemctl enable --now xrdp
```
