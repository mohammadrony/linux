# Update

War deployment update

```bash
sudo systemctl stop jenkins
```

Backup related files

```bash
tar -cvzf ~/jenkins.tar.gz /var/lib/jenkins
```

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
