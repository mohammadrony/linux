# SSH Login

Provider password for ssh

```sh
sshpass -p '<password>' ssh <user>@<host>
```

Login with identity file

```sh
ssh -i ~/.ssh/<file> <user>@<host>
```

```sh
ssh -i ~/.ssh/<file> -o IdentitiesOnly=yes <user>@<host>
```

Manage login to unknown hosts

```sh
ssh -o StrictHostKeyChecking=no <user>@<host>
```

For ssh-dss algorithm (legacy version)

```sh
ssh -o HostKeyAlgorithms=+ssh-dss <user>@<host>
```

Use password authentication

```sh
ssh -o PreferredAuthentications=password <user>@<host>
```

Using key exchange algorithm

```sh
ssh -o KexAlgorithms=curve25519-sha256 <user>@<host>
```
