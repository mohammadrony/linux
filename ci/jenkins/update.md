# Update

## Stable (LTS)

Unhold current version

```bash
sudo apt-mark unhold jenkins
```

Update jenkins

```bash
sudo apt install -y jenkins
```

Hold current version

```bash
sudo apt-mark hold jenkins
```

## Weekly release

Stop service

```bash
sudo systemctl stop jenkins
```

Backup jenkins binary

```bash
cd /usr/share/java
sudo mv jenkins.war jenkins.war.old
```

Download latest release

```bash
cd /usr/share/java
sudo wget https://updates.jenkins-ci.org/latest/jenkins.war
```

Restart service

```bash
sudo systemctl restart jenkins
```
