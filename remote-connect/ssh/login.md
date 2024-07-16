# SSH Login

For ssh-dss algorithm (legacy version)

```bash
ssh -oHostKeyAlgorithms=+ssh-dss <user>@<host>
```

Manage login to unknown hosts

```bash
ssh -o StrictHostKeyChecking=no <user>@<host>
```

Provider password for ssh

```bash
sshpass -p '<password>' ssh <user>@<host>
```

Login with identity file

```bash
ssh -i ~/.ssh/<file> <user>@<host>
```

```bash
ssh -i ~/.ssh/<file> -o IdentitiesOnly=yes <user>@<host>
```

Force password authentication

```bash
ssh -o PreferredAuthentications=password <user>@<host>
```

```bash
sshpass -p '<password>' ssh -o PreferredAuthentications=password <user>@<host>
```
