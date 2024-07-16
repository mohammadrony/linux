# Public Key Authentication

Generate ssh-key

```bash
ssh-keygen -f ~/.ssh/rsa
```

Copy new public key to remote hosts `~.ssh/authorized_keys` file

```bash
ssh-copy-id -i ~/.ssh/rsa.pub user@host
```

## Update sshd configuration

```bash
sudo vi /etc/ssh/sshd_config
```

```txt
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```

```bash
# sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
# sudo sed -i 's/^#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config
```

```bash
sudo systemctl reload sshd
```

## Connect from remote host

```bash
ssh <user>@host
```
