# SSH Known Hosts

```bash
ssh -o StrictHostKeyChecking=no user@host
```

Add host as known hosts

```bash
ssh-keyscan -H <host> >> ~/.ssh/known_hosts
```

Remove host from known hosts

```bash
ssh-keygen -R <host>
```
