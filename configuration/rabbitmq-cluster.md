# RabbitMQ Cluster

- [RabbitMQ Docs](https://www.rabbitmq.com/docs/download)
- [Installation Guide](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04)

## Prerequisites

Update hosts

```sh
sudo tee -a /etc/hosts << EOF
192.168.0.101 rabbitmq-1
192.168.0.102 rabbitmq-2
192.168.0.103 rabbitmq-3
EOF
```

```sh
sudo apt install -y curl gnupg apt-transport-https -y
```

## Configuration

### Package Install

Add gpg keys

```sh
curl -1sLf "https://keys.openpgp.org/vks/v1/by-fingerprint/0A9AF2115F4687BD29803A206B73A36E6026DFCA" | sudo gpg --dearmor | sudo tee /etc/apt/keyrings/com.rabbitmq.team.gpg > /dev/null
curl -1sLf "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf77f1eda57ebb1cc" | sudo gpg --dearmor | sudo tee /etc/apt/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg > /dev/null
curl -1sLf "https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey" | sudo gpg --dearmor | sudo tee /etc/apt/keyrings/io.packagecloud.rabbitmq.gpg > /dev/null
```

Add package source

```sh
sudo tee -a /etc/apt/sources.list.d/rabbitmq.list << EOF
deb [signed-by=/etc/apt/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu jammy main
deb-src [signed-by=/etc/apt/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu jammy main
deb [signed-by=/etc/apt/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ jammy main
deb-src [signed-by=/etc/apt/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ jammy main
EOF
```

Update package source list

```sh
sudo apt update
```

Install rabbitmq server

```sh
sudo apt install -y erlang-base \
  erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
  erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
  erlang-runtime-tools erlang-snmp erlang-ssl erlang-manpages \
  erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl
```

```sh
sudo apt install -y rabbitmq-server
```

Check status

```sh
systemctl status rabbitmq-server
```

### Clustering

Updater erlang cookie for clustering

```sh
cd /var/lib/rabbitmq/
sudo chmod 600 .erlang.cookie
sudo tee .erlang.cookie << EOF
12345
EOF
sudo chmod 400 .erlang.cookie
```

```sh
ls -al /var/lib/rabbitmq/
sudo cat /var/lib/rabbitmq/.erlang.cookie
```

Restart service

```sh
sudo systemctl restart rabbitmq-server
```

Join cluster

```sh
sudo rabbitmqctl stop_app
sudo rabbitmqctl join_cluster rabbit@rabbitmq-1
sudo rabbitmqctl start_app
```

### RabbitMQ Management

```sh
sudo rabbitmq-plugins list
```

Enable management plugin

```sh
sudo rabbitmq-plugins enable rabbitmq_management rabbitmq_prometheus
```

```sh
sudo rabbitmqctl list_feature_flags
sudo rabbitmqctl enable_feature_flag all # name
```

Add user

```sh
sudo rabbitmqctl add_user admin admin
```

Set permission

```sh
sudo rabbitmqctl set_user_tags admin administrator
```

```sh
sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
sudo rabbitmqctl set_permissions --vhost / admin ".*" ".*" ".*"
```

Change user password

```sh
sudo rabbitmqctl change_password <user> <password>
```

### Management Console Configuration

Login

- Open rabbitmq [management console](http://localhost:15672) and Use `admin` username and `admin` password to login.
- Update current password
  - admin settings > Update this user > Enter password > Update user.

Import definition

- Goto Overview page > Import definitions > Select Definitions file > Upload broker definitions.

Export definition

- Goto Overview page > Export definitions > Enter filename > Select Virtual host > Download broker definitions.

## Cleanup

Stop rabbitmq service

```sh
sudo systemctl disable --now rabbitmq-server
```

Remove package source

```sh
sudo rm /etc/apt/sources.list.d/rabbitmq.list
sudo rm /etc/apt/keyrings/*rabbitmq* -rf
```

Remove rabbitmq server

```sh
sudo apt remove -y rabbitmq-server
```

Remove related packages

```sh
sudo apt remove -y erlang-base \
  erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
  erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
  erlang-runtime-tools erlang-snmp erlang-ssl erlang-manpages \
  erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl
```
