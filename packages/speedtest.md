# Speedtest CLI

## Snap

```bash
sudo snap install speedtest-cli
```

Install snapd in [RHEL](./snap.md).

## Binary

```bash
wget https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz -O speedtest-cli.tgz
tar -zxvf speedtest-cli.tgz
./speedtest
```

```bash
```

## Ubuntu

Package

```bash
sudo apt install -y speedtest
```

Script

```bash
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh -o install.sh

sudo bash install.sh
rm -f install.sh
```

```bash
speedtest
```

## RHEL

Package

```bash
sudo yum install -y speedtest
```

Script

```bash
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh -o install.sh

sudo bash install.sh
rm -f install.sh
```

```bash
speedtest
```

## Uninstall

Ubuntu

```bash
sudo apt remove -y speedtest-cli
```

RHEL

```bash
sudo rm /etc/yum.repos.d/ookla_speedtest-cli.repo
```

```bash
sudo yum remove -y speedtest
```
