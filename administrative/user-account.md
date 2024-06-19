# User Account

Update **USER** and **GROUP** with real value.

## Create User

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

## Update User

Add users to group

```bash
sudo usermod -aG GROUP USER
```

```bash
sudo gpasswd -a USER GROUP
```

Update user password

```bash
sudo passwd USER
```

Delete password

```bash
sudo passwd -d USER
```

Update user shell

```bash
sudo usermod -s /bin/bash USER
```

```bash
sudo usermod -s /usr/sbin/nologin USER
```

## Delete User

```bash
sudo userdel USER
```

```bash
sudo rm /home/USER -rf
```
