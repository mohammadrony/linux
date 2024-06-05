# Flatpak

Install Flatpak

```bash
sudo apt install -y flatpak gnome-software-plugin-flatpak
```

```bash
sudo reboot now
```

Install Flathub

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

```bash
sudo flatpak install -y flathub
```
