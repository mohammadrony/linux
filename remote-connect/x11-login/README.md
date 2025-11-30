# X11 Login

Set Gnome login screen to x11

```sh
sudo sed -i 's/^#\(WaylandEnable=false\)/\1/' /etc/gdm3/custom.conf
```

```sh
cat /etc/gdm3/custom.conf | grep Wayland
```

```sh
sudo reboot now
```
