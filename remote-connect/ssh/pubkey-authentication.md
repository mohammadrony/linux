# Public Key Authentication

Generate ssh-key

```sh
ssh-keygen -f ~/.ssh/rsa
```

Copy new public key to remote hosts `~.ssh/authorized_keys` file

```sh
ssh-copy-id -i ~/.ssh/rsa.pub user@host
```

## Update configuration

```sh
sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config
```

Or

```sh
sudo vi /etc/ssh/sshd_config
```

```txt
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```

Reload service

```sh
sudo systemctl reload ssh # sshd
```

## Connect with ssh

```sh
ssh <user>@<host>
```
