# Session

## Gnome UI

Gnome desktop

```bash
sudo apt install -y ubuntu-gnome-desktop xrdp
```

Tasksel

```bash
sudo apt install -y tasksel
```

GDM3

```bash
sudo apt install -y --no-install-recommends gnome-core
```

```bash
sudo apt install -y gdm3
sudo dpkg-reconfigure gdm3
```

```bash
sudo reboot now
```

## Logout

Logout

```bash
gnome-session-quit
```

Logout immediately

```bash
gnome-session-quit --no-prompt
```
