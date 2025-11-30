# EPEL Release

## RHEL

Redhat Linux 8 9

```sh
sudo dnf install -y epel-release
```

```sh
N=9 # 8
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$N.noarch.rpm
sudo dnf upgrade
```

RedHat Linux 7

```sh
sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo dnf upgrade
```

## Oracle Linux

Oracle Linux 7

```sh
sudo yum install -y oracle-epel-release-el7
```
