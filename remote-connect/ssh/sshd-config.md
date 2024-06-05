# SSH Server Config

Create original copy

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
```

Change configuration

`sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config`

`sudo sed -i 's/^#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config`

`sudo sed -i 's/^#PermitRootLogin\s.*/PermitRootLogin yes\n\1/' /etc/ssh/sshd_config`

Restart SSH service

```bash
sudo systemctl reload sshd
```
