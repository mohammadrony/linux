# Sysdig

[Repository](https://github.com/draios/sysdig)

## Installation

[How to Install Sysdig for Linux](https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-for-Linux)

Installation

```bash
curl -s https://download.sysdig.com/DRAIOS-GPG-KEY.public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sysdig.gpg > /dev/null
sudo curl -s -o /etc/apt/sources.list.d/draios.list https://download.sysdig.com/stable/deb/draios.list  
sudo apt update
```

```bash
sudo apt install -y linux-headers-$(uname -r)
```

```bash
sudo apt install -y sysdig
```

Update user permission

```bash
sudo groupadd sysdig
sudo usermod -aG sysdig $USER
```

```bash
sudo tee -a /etc/sudoers.d/sysdig << EOF
%sysdig ALL= /usr/bin/sysdig
EOF
```

## Usage

csysdig

```bash
sudo csysdig
```
