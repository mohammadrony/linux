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
realpath $(which java)
```

```bash
vi ~/.bashrc
```

```bash
export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which java)))))
export PATH=$PATH:$JAVA_HOME/bin
```

```bash
source ~/.bashrc
java --version
```

Install Maven

```bash
sudo dnf install -y maven
```
