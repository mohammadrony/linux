# SSH Login

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

Manage login to unknown hosts

```bash
ssh -o StrictHostKeyChecking=no <user>@<host>
```

For ssh-dss algorithm (legacy version)

```bash
ssh -o HostKeyAlgorithms=+ssh-dss <user>@<host>
```

Use password authentication

```bash
ssh -o PreferredAuthentications=password <user>@<host>
```

Using key exchange algorithm

```bash
ssh -o KexAlgorithms=curve25519-sha256 <user>@<host>
```
