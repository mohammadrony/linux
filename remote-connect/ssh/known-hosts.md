# SSH Known Hosts

```bash
ssh -o StrictHostKeyChecking=no user@host
```

Remove host from known_hosts file

```bash
ssh-keygen -R <host>,<ip-address>
```

Add hosts to known_hosts

```bash
ssh-keyscan -H <host>,<ip-address>
```

```bash
ssh-keyscan -t rsa -H <host>
```

```bash
ssh-keyscan -H <host>,<ip-address> >> ~/.ssh/known_hosts
```
