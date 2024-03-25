# Java and Maven setup

Install Java

```bash
sudo apt install -y openjdk-17-jdk openjdk-17-jre
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
sudo apt install -y maven
```
