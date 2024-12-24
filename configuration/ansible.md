# Ansible

## Control Node

Ubuntu package

```bash
sudo apt install -y ansible
```

RHEL package

```bash
sudo dnf install -y epel-release
sudo dnf install -y ansible
```

Create SSH authentication

```bash
ssh-keygen -f ~/.ssh/id_rsa
```

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
```

## Remote Node

Update sshd config

```bash
sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config
sudo systemctl reload ssh # sshd
```

Password less sudo command execution

```bash
USER=username
tee -a /etc/sudoers.d/$USER << EOF
$USER ALL=(ALL) NOPASSWD: ALL
EOF
```

## Config and Inventory setup

Ansible config

```bash
tee -a ./ansible.cfg << EOF
[defaults]
log_path                = ./ansible.log
interpreter_python      = auto_silent
inventory               = ./hosts
deprecation_warnings    = false
command_warnings        = false
strategy                = linear
verbosity               = 1
forks                   = 5
EOF
```

Inventory file

```bash
sudo tee -a ./hosts << EOF
[all:vars]
ansible_user=USERNAME
ansible_ssh_pass=PASSWORD
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[group1]
192.168.1.101

[group2]
192.168.1.102
192.168.1.103
EOF
```

Other inventory file

- `/etc/ansible/hosts`

## Ping for ansible connection

```bash
ansible all -m ping
```
