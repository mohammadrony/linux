# Setup Ansible control node and managed node in CentOS-9

## Node Naming convention

| Host name | Used terms |
|-----------|------------|
| Ansible host | control node |
| remote host 1 | managed node |
| remote host 2 | managed node |
--------------------------------

## Configure IP address and host name in control node for ansible

```bash
echo '<ip-addr1> <host-name1>' >> /etc/hosts
echo '<ip-addr2> <host-name2>' >> /etc/hosts
echo '<ip-addr3> <host-name3>' >> /etc/hosts
```

## Configure IP address and host name in managed nodes

Commands mentioning `<remote-host>` here for each managed node.

```bash
remote_host="<remote-host>"

ssh root@${remote_host} "echo '<ip-addr1> <host-name1>' >> /etc/hosts"
ssh root@${remote_host} "echo '<ip-addr2> <host-name2>' >> /etc/hosts"
```

## Install Ansible in control node

```bash
sudo dnf install -y epel-release
sudo dnf install -y ansible
```

## Create ansible user in control node

```bash
sudo useradd ansible
```

## Setup password for ansible user and login

Create new password

```bash
sudo passwd ansible
su - ansible
```

Or delete the password

```bash
sudo passwd -d ansible
su - ansible
```

## Generate ssh-key in control node as ansible user

```bash
ssh-keygen -f /home/ansible/.ssh/id_rsa
```

## Prepare ansible managed nodes

Commands mentioning `<remote-host>` is required to run in all managed node.

### Create ansible user in managed node

```bash
remote_host="<remote-host>"
ansible_home='/home/ansible'

ssh root@${remote_host} "useradd ansible"
ssh root@${remote_host} "mkdir -p ${ansible_home}/.ssh"
ssh root@${remote_host} "chmod 700 ${ansible_home}/.ssh"
ssh root@${remote_host} "chown -R ansible:ansible ${ansible_home}/.ssh"
```

### Copy id_rsa.pub key from control node to managed nodes .ssh/authorized_keys file

```bash
remote_host="<remote-host>"
ansible_home='/home/ansible'

scp ${ansible_home}/.ssh/id_rsa.pub root@<remote-host>:${ansible_home}/.ssh/id_rsa.pub
ssh root@${remote_host} "chown ansible:ansible ${ansible_home}/.ssh/id_rsa.pub"
ssh root@${remote_host} "tee < ${ansible_home}/.ssh/id_rsa.pub -a ${ansible_home}/.ssh/authorized_keys"
ssh root@${remote_host} "chown ansible:ansible ${ansible_home}/.ssh/authorized_keys"
ssh root@${remote_host} "chmod 600 ${ansible_home}/.ssh/authorized_keys"
```

### Add ansible to sudoers group for managed nodes

```bash
ssh root@<remote-host> "echo 'ansible ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ansible"
```

### Allow ansible user to execute command remotely from control node

```bash
remote_host="<remote-host>"

ssh root@${remote_host} "sed -i 's/#PubkeyAuthentication\syes/PubkeyAuthentication yes/' /etc/ssh/sshd_config"
ssh root@${remote_host} "sed -i 's/#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config"
ssh root@${remote_host} "systemctl restart sshd"
```

## Add host groups in control node for ansible user

```bash
sudo tee -a /etc/ansible/hosts << EOF
[<hostgroup1>]
<hostname1>

[<hostgroup2>]
<hostname2>
<hostname3>
EOF
```

## Add hosts to local known_hosts file

### Adding host using ssh

```bash
ssh -o StrictHostKeyChecking=no ansible@<hostname1>
ssh -o StrictHostKeyChecking=no ansible@<hostname2>
ssh -o StrictHostKeyChecking=no ansible@<hostname3>
```

### Adding host using ssh-keyscan with unique entries

```bash
ssh-keygen -R <hostname>,<ip-address>
ssh-keyscan -H <hostname>,<ip-address> >> ~/.ssh/known_hosts
```

## Verify the connection is established between control node and managed node

```bash
ansible all -m ping
```
