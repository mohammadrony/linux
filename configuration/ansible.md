# Ansible

## Installation

Ubuntu package

```sh
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ansible/ansible
```

```sh
sudo apt install -y ansible
```

RHEL package

```sh
sudo dnf install -y epel-release
sudo dnf install -y ansible
```

## Config

```sh
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

## Connect Node

Generate SSH key

```sh
ssh-keygen -f ~/.ssh/id_rsa
```

Connect remote server

```sh
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
```

Remote node's config

```sh
sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config
sudo systemctl reload ssh # sshd
```

Passwordless sudo user

```sh
USER=username
tee -a /etc/sudoers.d/$USER << EOF
$USER ALL=(ALL) NOPASSWD: ALL
EOF
```

## Inventory

```sh
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

Default inventory

- `/etc/ansible/hosts`

Inventory info

```sh
ansible-inventory --list
```

## Ping test

```sh
ansible all -m ping
```
