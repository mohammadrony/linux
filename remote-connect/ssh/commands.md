# Connect using SSH

For ssh-dss algorithm (legacy version)

```bash
ssh -oHostKeyAlgorithms=+ssh-dss user@host
```

Manage login to unknown hosts

```bash
ssh -o StrictHostKeyChecking=no user@host
```

Remove host from known_hosts

```bash
ssh-keygen -R host,ip-address
ssh-keyscan -H host,ip-address >> ~/.ssh/known_hosts
```
