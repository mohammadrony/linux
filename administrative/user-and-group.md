# User and Group

Update **USER** and **GROUP** with real value.

## Create User

CentOS and Ubuntu

```sh
USER=username
sudo useradd $USER
sudo usermod -aG wheel $USER
```

```sh
USER=username
PASSWORD=password
useradd -m -s /bin/bash -p $(openssl passwd -1 $PASSWORD) $USER
usermod -aG sudo $USER
```

Ubuntu

```sh
USER=username
sudo adduser --gecos "" $USER
sudo usermod -aG sudo $USER
```

```sh
USER=username
PASSWORD=password
useradd -m -s /bin/bash -p $(openssl passwd -1 $PASSWORD) $USER
usermod -aG sudo $USER
```

Password less sudo command execution

```sh
USER=username
sudo tee -a /etc/sudoers.d/$USER << EOF
$USER ALL=(ALL) NOPASSWD: ALL
EOF
```

*Sometimes user needs to logout and re-login to update the group. Or [follow this](https://superuser.com/questions/272061/reload-a-linux-users-group-assignments-without-logging-out) to reload users groups without logging out.*

```sh
logout
```

## Create Group

CentOS and Ubuntu

```sh
sudo groupadd GROUP
```

Ubuntu

```sh
sudo addgroup GROUP
```

## Update User

Add users to group

```sh
sudo usermod -aG GROUP USER
```

```sh
sudo gpasswd -a USER GROUP
```

Update user password

```sh
sudo passwd USER
```

Remove user from a group

```sh
sudo gpasswd -d USER GROUP
```

Update user default shell

```sh
sudo usermod -s /bin/bash USER
```

```sh
sudo usermod -s /usr/sbin/nologin USER
```

Delete password

```sh
sudo passwd -d USER
```

## Delete User

CentOS and Ubuntu

```sh
sudo userdel USER
```

Ubuntu

```sh
sudo deluser USER
```

Delete user files

```sh
sudo rm /home/USER -rf
```

## Delete Group

CentOS and Ubuntu

```sh
sudo groupdel GROUP
```

Ubuntu

```sh
sudo delgroup GROUP
```
