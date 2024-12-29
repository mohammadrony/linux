# Update

War deployment update

```bash
sudo systemctl stop jenkins
```

Backup jenkins binary and related files

```bash
tar -cvzf ~/jenkins.tar.gz /var/lib/jenkins
```

```bash
cd /var/lib/jenkins
sudo mv jenkins.war jenkins.war.old
```

Download latest release

```bash
wget https://updates.jenkins-ci.org/latest/jenkins.war
sudo mv jenkins.war /var/lib/jenkins
```

Restart service

```bash
sudo systemctl start jenkins
```
