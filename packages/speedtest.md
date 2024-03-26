# Speedtest CLI

## Snap

```bash
sudo snap install speedtest-cli
```

Install snapd in [RHEL](./snap.md).

## Package

Ubuntu

```bash
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt install -y speedtest
```

RHEL

```bash
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
sudo yum install -y speedtest
```

## Examples

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
