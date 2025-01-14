# Installation

```bash
sudo useradd -b /opt/sonarqube -s /bin/bash sonarqube
```

```bash
sudo vi /etc/sysctl.conf
```

```conf
vm.max_map_count=524288
fs.file-max=131072
```

```bash
sudo sysctl --system
```

```bash
ulimit -n 131072
ulimit -u 8192
```

```bash
sudo vi /etc/security/limits.d/99-sonarqube.conf
```

```conf
sonarqube   -   nofile   131072
sonarqube   -   nproc    8192
```

```bash
sudo apt install unzip software-properties-common wget
```
