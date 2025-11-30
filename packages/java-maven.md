# Java and Maven

## Install Java

Ubuntu

```sh
sudo apt install -y openjdk-17-jdk openjdk-17-jre
```

RHEL

```sh
sudo dnf install -y java-17-openjdk java-17-openjdk-devel
```

Configure Java default version

```sh
sudo update-alternatives --config java
```

Update JAVA_HOME

```sh
# Update ~/.bashrc and ~/.zshrc
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH=$PATH:$JAVA_HOME/bin
```

## Install Maven

Ubuntu

```sh
sudo apt install -y maven
```

RHEL

```sh
sudo dnf install -y maven
```
