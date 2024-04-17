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

```bash
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt install -y speedtest
```

```bash
speedtest
```

## RHEL

```bash
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
sudo yum install -y speedtest
```

```bash
speedtest
```

## Remove speedtest

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
