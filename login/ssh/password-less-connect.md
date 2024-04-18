# Configure SSH Connection without password

## Create new user if you need

```bash
sudo useradd <user_name>
```

## Setup password for the user

Create new password

```bash
sudo passwd <user_name>
```

Or delete the password

```bash
sudo passwd -d <user_name>
```

## Generate ssh-key locally

```bash
ssh-keygen -f /home/<user_name>/.ssh/id_rsa
```

## Prepare remote hosts

### Copy local id_rsa.pub key to remote hosts .ssh/authorized_keys file

```bash
local_user="<local-user>"
remote_host="<remote-host>"
remote_user="<remote-user>"

ssh root@${remote_host} "mkdir -p /home/${remote_user}/.ssh"
scp /home/${local_user}/.ssh/id_rsa.pub root@${remote_host}:/home/${remote_user}/.ssh/id_rsa.pub
ssh root@${remote_host} "tee < /home/${remote_user}/.ssh/id_rsa.pub -a /home/${remote_user}/.ssh/authorized_keys"
ssh root@${remote_host} "chown -R ${remote_user}:${remote_user} ${remote_user}/.ssh"
ssh root@${remote_host} "chmod 700 /home/${remote_user}/.ssh"
ssh root@${remote_host} "chmod 600 /home/${remote_user}/.ssh/authorized_keys"
```

### If you want your remote user to have root privilege

```bash
remote_user=<remote-user>
ssh root@<remote-host> "echo '${remote_user} ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/${remote_user}"
```

## Verify the connection is established between local host and remote node

```bash
ssh <remote-user>@<remote-host>
```
