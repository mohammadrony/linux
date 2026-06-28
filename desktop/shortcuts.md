# Keyboard Shortcuts

Ubuntu / GNOME

## Shortcuts

| Category | Action | Shortcut |
|---|---|---|
| Custom | Launch VS Code | Alt + C |
| Custom | Launch Ghostty terminal | Alt + X |
| Navigation | Switch to workspace 1 | Super + 1 |
| Navigation | Switch to workspace 2 | Super + 2 |
| Navigation | Switch to workspace 3 | Super + 3 |
| Navigation | Switch to workspace 4 | Super + 4 |
| Navigation | Move window to workspace left | Ctrl + Super + Left |
| Navigation | Move window to workspace right | Ctrl + Super + Right |
| Navigation | Switch to workspace on the left | Alt + Super + Left |
| Navigation | Switch to workspace on the right | Alt + Super + Right |
| Navigation | Move window one monitor to the left | Super + Left |
| Navigation | Move window one monitor to the right | Super + Right |
| Launchers | Launch web browser | Alt + F |
| Window | Hide window | Alt + D |
| Window | Toggle maximization state | Super + Up |
| Window | Restore window | Super + Down |

---

## Apply via gsettings

Run these commands as the target user to apply all shortcuts at once.

### Window manager keybindings

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Alt><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Alt><Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Alt>d']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down']"
```

### Launcher and system keybindings

```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Alt>f']"
```

### Custom app launcher keybindings

```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
  "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Alt>x'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Visual Studio Code'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'code'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Alt>c'
```

### Verify

```bash
gsettings get org.gnome.desktop.wm.keybindings switch-to-workspace-1
# Expected: ['<Super>1']

gsettings get org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding
# Expected: '<Alt>x'
```
