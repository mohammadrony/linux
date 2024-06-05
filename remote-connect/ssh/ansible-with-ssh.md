# Ansible with SSH

## Ansible control node configuration

Package installation

```bash
sudo dnf install -y epel-release
sudo dnf install -y ansible
```

Create SSH authentication

```bash
ssh-keygen -f ~/.ssh/id_rsa
```

```bash
ssh-copy-id -i id_rsa.pub user@host
```

## Ansible managed node configuration

Update sshd config

```bash
sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#AuthorizedKeysFile\s.ssh\/authorized_keys/AuthorizedKeysFile .ssh\/authorized_keys/' /etc/ssh/sshd_config
sudo systemctl reload sshd
```

Password less sudo command execution

```bash
tee -a /etc/sudoers.d/user_name << EOF
user_name ALL=(ALL) NOPASSWD: ALL
EOF
```

## Inventory setup in control node

Hostname and IP address resolution

```bash
sudo tee -a /etc/hosts << EOF
192.168.0.101 ansible-host-1
192.168.0.102 ansible-host-2
192.168.0.103 ansible-host-3
EOF
```

Create local inventory

```bash
sudo tee -a ./hosts << EOF
[hostgroup1]
ansible-host-1

[hostgroup2]
ansible-host-2
ansible-host-3
EOF
```

```bash
tee -a ./ansible.cfg << EOF
[defaults]
inventory = ./hosts
EOF
```

Update inventory in `/etc/ansible/`

```bash
sudo tee -a /etc/ansible/hosts << EOF
[hostgroup1]
ansible-host-1

[hostgroup2]
ansible-host-2
ansible-host-3
EOF
```

## Ping for ansible connection

```bash
ansible all -m ping
```
