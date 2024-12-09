# User and Group

Update **USER** and **GROUP** with real value.

## Create User

CentOS and Ubuntu

```bash
USER=username
sudo useradd $USER
sudo usermod -aG wheel $USER
```

```bash
USER=username
PASSWORD=password
useradd -m -s /bin/bash -p $(openssl passwd -1 $PASSWORD) $USER
usermod -aG sudo $USER
```

Ubuntu

```bash
USER=username
sudo adduser --gecos "" $USER
sudo usermod -aG sudo $USER
```

```bash
USER=username
PASSWORD=password
useradd -m -s /bin/bash -p $(openssl passwd -1 $PASSWORD) $USER
usermod -aG sudo $USER
```

Password less sudo command execution

```bash
USER=username
sudo tee -a /etc/sudoers.d/$USER << EOF
$USER ALL=(ALL) NOPASSWD: ALL
EOF
```

*Sometimes user needs to logout and re-login to update the group. Or [follow this](https://superuser.com/questions/272061/reload-a-linux-users-group-assignments-without-logging-out) to reload users groups without logging out.*

```bash
logout
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
