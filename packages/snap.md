# Snap

## RHEL Installation

```bash
N=9 # RHEL version 8 9
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$N.noarch.rpm
sudo dnf upgrade
```

```bash
N=7 # RHEL version 7
sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-$N.noarch.rpm
sudo dnf upgrade
```

Adding recommended repositories

```bash
sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
sudo yum update -y
```

Install snapd

```bash
sudo yum install -y snapd
```

Start service

```bash
sudo systemctl enable --now snapd
```

Update file link

```bash
sudo ln -s /var/lib/snapd/snap /snap
```

## Snap Commands

Update

```bash
sudo snap refresh
```

Search

```bash
sudo snap search APPNAME
sudo snap info APPNAME
```

Install

```bash
sudo snap install APPNAME
```

Stop update

```bash
snap changes
```

```bash
sudo snap abort <id>
```

Uninstall

```bash
sudo snap remove APPNAME
```

## Remove Previous Versions

```bash
snap list --all | awk '/disabled/{print $1, $3}' |
  while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
  done
```
