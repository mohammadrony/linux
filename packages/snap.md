# Snap

## RHEL Installation

```sh
N=9 # RHEL version 8 9
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$N.noarch.rpm
sudo dnf upgrade
```

```sh
N=7 # RHEL version 7
sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-$N.noarch.rpm
sudo dnf upgrade
```

Adding recommended repositories

```sh
sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
sudo yum update -y
```

Install snapd

```sh
sudo yum install -y snapd
```

Start service

```sh
sudo systemctl enable --now snapd
```

Update file link

```sh
sudo ln -s /var/lib/snapd/snap /snap
```

## Snap Commands

Update

```sh
sudo snap refresh
```

Search

```sh
sudo snap search APPNAME
sudo snap info APPNAME
```

Install

```sh
sudo snap install APPNAME
```

Stop update

```sh
snap changes
```

```sh
sudo snap abort <id>
```

Uninstall

```sh
sudo snap remove APPNAME
```

## Remove Previous Versions

```sh
snap list --all | awk '/disabled/{print $1, $3}' |
  while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
  done
```
