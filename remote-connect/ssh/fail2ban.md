# Fail2ban

## Introduction

- Fail2Ban is an intrusion prevention tool to block brute-force attempts.

## Installation

```sh
sudo apt install -y fail2ban
```

## Configuration

```sh
cd /etc/fail2ban
sudo cp jail.conf jail.local
```

```sh
sudo vi jail.local 
```

```conf
[DEFAULT]
ignoreip = 127.0.0.1/8 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16
```

## Restart service

```sh
sudo systemctl restart fail2ban
sudo systemctl status fail2ban
```

## Status

```sh
sudo fail2ban-client status sshd
```

```sh
sudo fail2ban-client get sshd ignoreip 
```
