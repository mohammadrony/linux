# Update

## Stable (LTS)

Unhold current version

```sh
sudo apt-mark unhold jenkins
```

Update jenkins

```sh
sudo apt install -y jenkins
```

Hold current version

```sh
sudo apt-mark hold jenkins
```

## Weekly release

Stop service

```sh
sudo systemctl stop jenkins
```

Backup jenkins binary

```sh
cd /usr/share/java
sudo mv jenkins.war jenkins.war.old
```

Download latest release

```sh
cd /usr/share/java
sudo wget https://updates.jenkins-ci.org/latest/jenkins.war
```

Restart service

```sh
sudo systemctl restart jenkins
```
