# X11 Login

Set Gnome login screen to x11

```bash
sudo sed -i 's/^#\(WaylandEnable=false\)/\1/' /etc/gdm3/custom.conf
```

```bash
cat /etc/gdm3/custom.conf | grep Wayland
```

```bash
sudo reboot now
```
