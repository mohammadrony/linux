# Public Key Authentication

Generate ssh-key

```bash
ssh-keygen -f ~/.ssh/rsa
```

Copy new public key to remote hosts `~.ssh/authorized_keys` file

```bash
ssh-copy-id -i ~/.ssh/rsa.pub user@host
```

## Update configuration

```bash
sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config
```

Or

```bash
sudo vi /etc/ssh/sshd_config
```

```txt
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```

Reload service

```bash
sudo systemctl reload ssh # sshd
```

## Connect with ssh

```bash
ssh <user>@<host>
```
