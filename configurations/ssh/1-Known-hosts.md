# SSH known hosts

```bash
ssh -o StrictHostKeyChecking=no user@host
```

Add host as known hosts

```bash
ssh-keyscan -H <host-address> >> ~/.ssh/known_hosts
```

Remove host from known hosts

```bash
ssh-keygen -R <host-address>
```
