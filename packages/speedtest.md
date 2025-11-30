# Speedtest CLI

## Snap

```sh
sudo snap install speedtest-cli
```

Install snapd in [RHEL](./snap.md).

## Binary

```sh
wget https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz -O speedtest-cli.tgz
tar -zxvf speedtest-cli.tgz
./speedtest
```

```sh
```

## Ubuntu

Package

```sh
sudo apt install -y speedtest
```

Script

```sh
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh -o install.sh

sudo bash install.sh
rm -f install.sh
```

```sh
speedtest
```

## RHEL

Package

```sh
sudo yum install -y speedtest
```

Script

```sh
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh -o install.sh

sudo bash install.sh
rm -f install.sh
```

```sh
speedtest
```

## Uninstall

Ubuntu

```sh
sudo apt remove -y speedtest-cli
```

RHEL

```sh
sudo rm /etc/yum.repos.d/ookla_speedtest-cli.repo
```

```sh
sudo yum remove -y speedtest
```
