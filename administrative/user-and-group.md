# User and Group

Update **USER** and **GROUP** with real value.

## Create User

CentOS and Ubuntu

```bash
USER=linux
sudo useradd $USER
sudo usermod -aG wheel $USER
```

Ubuntu

```bash
USER=linux
sudo adduser --gecos "" $USER
sudo usermod -aG sudo $USER
```

Password less sudo command execution

```bash
USER=linux
sudo tee -a /etc/sudoers.d/$USER << EOF
$USER ALL=(ALL) NOPASSWD: ALL
EOF
```

## Create Group

CentOS and Ubuntu

```bash
sudo groupadd GROUP
```

Ubuntu

```bash
sudo addgroup GROUP
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

Remove user from a group

```bash
sudo gpasswd -d USER GROUP
```

Update user default shell

```bash
sudo usermod -s /bin/bash USER
```

```bash
sudo usermod -s /usr/sbin/nologin USER
```

Delete password

```bash
sudo passwd -d USER
```

## Delete User

CentOS and Ubuntu

```bash
sudo userdel USER
```

Ubuntu

```bash
sudo deluser USER
```

Delete user files

```bash
sudo rm /home/USER -rf
```

## Delete Group

CentOS and Ubuntu

```bash
sudo groupdel GROUP
```

Ubuntu

```bash
sudo delgroup GROUP
```
