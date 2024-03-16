# User Management

## Login Sessions

```bash
w
```

```bash
who
```

```bash
last
```

```bash
pkill -9 -t <tty-name>
```

## User Entry

Create new User

```bash
sudo adduser --gecos="" user_name
```

Switch to new user

```bash
su - user_name
```

```bash
su user_name
```

Delete user

```bash
sudo deluser user_name
```

## Update User

Add users to group

```bash
sudo usermod -aG group_name user_name
```

```bash
sudo gpasswd -a user_name group_name
```

Update user password

```bash
sudo passwd user_name
```

Delete password

```bash
sudo passwd -d user_name
```

Update user shell

```bash
sudo usermod -s /bin/bash user_name
```

```bash
sudo usermod -s /usr/sbin/nologin user_name
```
