# RedHat Packages

## CentOS - Failed to download metadata for repo AppStream

Change baseurl

```bash
cd /etc/yum.repos.d/
sudo sed -i 's/^mirrorlist/#mirrorlist/' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
```

Install packages

```bash
sudo yum update
```

Reset configuration

```bash
cd /etc/yum.repos.d/
sudo sed -i 's/#mirrorlist/mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|baseurl=http://vault.centos.org|#baseurl=http://mirror.centos.org|g' /etc/yum.repos.d/CentOS-*
```
