# SSH Key

Generate key

```bash
ssh-keygen
```

```bash
ssh-keygen -t ed25519 -f ~/.ssh/ed25519
```

Copy SSH key to remote host

```bash
ssh-copy-id -i ~/.ssh/rsa.pub user@host
```

Remove host from known_hosts file

```bash
ssh-keygen -R <host>,<ip-address>
ssh-keyscan -H <host>,<ip-address> >> ~/.ssh/known_hosts
```
