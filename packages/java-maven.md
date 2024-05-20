# Java and Maven

## Install Java

Ubuntu

```bash
sudo apt install -y openjdk-17-jdk openjdk-17-jre
```

RHEL

```bash
sudo dnf install -y java-17-openjdk java-17-openjdk-devel
```

Configure Java default version

```bash
sudo update-alternatives --config java
```

Update JAVA_HOME

```bash
# Update ~/.bashrc and ~/.zshrc
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH=$PATH:$JAVA_HOME/bin
```

## Install Maven

Ubuntu

```bash
sudo apt install -y maven
```

RHEL

```bash
sudo dnf install -y maven
```
