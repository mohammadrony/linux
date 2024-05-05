# Create User

## Ubuntu

```bash
USERNAME=linux
sudo adduser --gecos "" $USERNAME
sudo usermod -aG sudo $USERNAME
sudo tee -a /etc/sudoers.d/$USERNAME << EOF
$USERNAME ALL=(ALL) NOPASSWD: ALL
EOF
```

## CentOS

```bash
USERNAME=linux
sudo useradd $USERNAME
sudo usermod -aG wheel $USERNAME
sudo tee -a /etc/sudoers.d/$USERNAME << EOF
$USERNAME ALL=(ALL) NOPASSWD: ALL
EOF
```
