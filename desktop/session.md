# Session

## Gnome UI

Gnome desktop

```sh
sudo apt install -y ubuntu-gnome-desktop xrdp
```

Tasksel

```sh
sudo apt install -y tasksel
```

GDM3

```sh
sudo apt install -y --no-install-recommends gnome-core
```

```sh
sudo apt install -y gdm3
sudo dpkg-reconfigure gdm3
```

```sh
sudo reboot now
```

## Logout

Logout

```sh
gnome-session-quit
```

Logout immediately

```sh
gnome-session-quit --no-prompt
```
