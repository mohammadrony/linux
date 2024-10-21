# Jenkins

## Installation

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
```

Update Jenkins Home

```bash
# USER=linux
sudo sed -i "s/User=jenkins/User=$USER/" /lib/systemd/system/jenkins.service
sudo sed -i "s#JENKINS_HOME=/var/lib/jenkins#JENKINS_HOME=/home/$USER/.jenkins#" /lib/systemd/system/jenkins.service
sudo sed -i "s#WorkingDirectory=/var/lib/jenkins#WorkingDirectory=/home/$USER/.jenkins#" /lib/systemd/system/jenkins.service
```

```bash
mkdir ~/.jenkins
```

```bash
sudo systemctl daemon-reload
sudo systemctl restart jenkins
```

Config file: `config.xml`

## Configuration

Inital setup

- Open <http://host:8080>
- Enter initial admin password from `/home/$USER/.jenkins/secrets/initialAdminPassword` file.
- Create admin password.
- Install suggested plugins.

Plugins

- [Kubernetes CLI](https://plugins.jenkins.io/kubernetes-cli/)
- [Docker](https://plugins.jenkins.io/docker-plugin/), [Docker Pipeline](https://plugins.jenkins.io/docker-workflow/)
- [AWS Credentials](https://plugins.jenkins.io/aws-credentials/)
- [Safe Restart](https://plugins.jenkins.io/saferestart)

Tools

- Goto Dashboard > Manage Jenkins > System Configuration > Tools > Add following tools

| Tool Name | Execution Path                        | Find Execution Path           |
|-----------|---------------------------------------|-------------------------------|
| JDK       | `/usr/lib/jvm/java-17-openjdk-amd64`  | `sudo find /usr/ -name *jdk`  |
| Git       | `/usr/bin/git`                        | `which git`                   |
| Maven     | `/usr/share/maven`                    | `mvn -v`                      |
| Docker    | `/usr/bin/`                           | `which docker`                |

Secrets

- Goto Dashboard > Manage Jenkins > Security > Credentials > System > Global credentials (unrestricted) > Add following credentials
- Kind: `Username with password`, ID: *`user_repo_readonly`*, Username: *`<username>`*,
Password: *`<password>`*

## Create Pipeline Job

Create a folder

- Goto Dashboard > New Item > Folder > Enter Name > Save

Create a pipeline

- Goto Dashboard > New Item > Create a job > Pipeline > Add configuration > Save

## Update Jenkins

War deployment update

```bash
sudo systemctl stop jenkins
```

Backup jenkins binary and related files

```bash
mv jenkins.war jenkins.war.old
```

```bash
tar -cvzf jenkins.tar.gz /var/lib/jenkins
```

Download latest release

```bash
wget https://updates.jenkins-ci.org/latest/jenkins.war
```

Restart service

```bash
sudo systemctl start jenkins
```
