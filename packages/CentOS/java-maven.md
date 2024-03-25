# Java and Maven setup

Install Java

```bash
sudo dnf install -y java-17-openjdk java-17-openjdk-devel
```

Configure Java default version

```bash
sudo alternatives --config java
```

Update JAVA_HOME

```bash
# Update ~/.bashrc and ~/.zshrc
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH=$PATH:$JAVA_HOME/bin
```

Install Maven

```bash
sudo dnf install -y maven
```
