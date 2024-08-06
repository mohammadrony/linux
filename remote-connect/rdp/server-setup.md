# Remote Desktop

## RHEL

Install RDP server

```bash
sudo yum -y install xrdp tigervnc-server
```

```bash
sudo systemctl enable --now xrdp
```

## Ubuntu

Install gnome desktop and RDP server

```bash
sudo apt install xrdp ubuntu-gnome-desktop
```

```bash
cat /etc/xrdp/xrdp.ini
```

```bash
sudo systemctl enable --now xrdp
```
