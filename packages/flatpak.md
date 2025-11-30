# Flatpak

Install Flatpak

```sh
sudo apt install -y flatpak gnome-software-plugin-flatpak
```

```sh
sudo reboot now
```

Install Flathub

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

```sh
sudo flatpak install -y flathub
```
