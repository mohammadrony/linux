# Create User

Ubuntu

```bash
USER=linux
sudo adduser --gecos "" $USER
sudo usermod -aG sudo $USER
```

CentOS

```bash
USER=linux
sudo useradd $USER
sudo usermod -aG wheel $USER
```

Password less sudo command execution

```bash
sudo tee -a /etc/sudoers.d/$USER << EOF
$USER ALL=(ALL) NOPASSWD: ALL
EOF
```
