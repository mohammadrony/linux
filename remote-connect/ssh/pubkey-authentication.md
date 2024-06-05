# Public Key Based Authentication

## Create user

```bash
sudo useradd user_name
```

Set password

```bash
sudo passwd user_name
# delete password
# sudo passwd -d user_name
```

Generate ssh-key locally

```bash
ssh-keygen -f /home/user_name/.ssh/id_rsa
```

## Prepare remote hosts

Copy new public key to remote hosts `~.ssh/authorized_keys` file

```bash
ssh-copy-id -i id_rsa.pub user@host
```

Manually update file

```bash
mkdir ~/.ssh
chmod 700 ~/.ssh
tee < ~/.ssh/id_rsa.pub -a ~/.ssh/authorized_keys"
chmod 600 ~/.ssh/authorized_keys"

chown -R user_name: ~/.ssh"
```

## Update sshd configuration

```bash
sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config
sudo systemctl reload sshd
```

## Connect from remote host

```bash
ssh user_name@host
```

## Enable password less sudo command execution

```bash
tee -a /etc/sudoers.d/user_name << EOF
user_name ALL=(ALL) NOPASSWD: ALL'
EOF
```
