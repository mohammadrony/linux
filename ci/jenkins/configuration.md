
# Configuration

Inital setup

- Open <http://localhost:8080>
- Enter initial admin password from `/var/lib/jenkins/secrets/initialAdminPassword` file.
- Create admin password.
- Install suggested plugins.

Plugins

- [Docker](https://plugins.jenkins.io/docker-plugin/)
- [Docker Pipeline](https://plugins.jenkins.io/docker-workflow/)
- [Kubernetes CLI](https://plugins.jenkins.io/kubernetes-cli/)

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
