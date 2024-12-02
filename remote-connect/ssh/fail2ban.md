# Fail2ban

## Introduction

- Fail2Ban is an intrusion prevention tool to block brute-force attempts.

## Installation

```bash
sudo apt install -y fail2ban
```

## Configuration

```bash
cd /etc/fail2ban
sudo cp jail.conf jail.local
```

```bash
sudo vi jail.local 
```

```conf
[DEFAULT]
ignoreip = 127.0.0.1/8 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16
```

## Restart service

```bash
sudo systemctl restart fail2ban
sudo systemctl status fail2ban
```

## Status

```bash
sudo fail2ban-client status sshd
```

```bash
sudo fail2ban-client get sshd ignoreip 
```
