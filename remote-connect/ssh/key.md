# SSH Key

Generate key

```bash
ssh-keygen
```

```bash
ssh-keygen -t rsa -f ~/.ssh/id_rsa
```

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
```

Copy SSH key to remote host

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
```

Remove host from known_hosts file

```bash
ssh-keygen -R <host>,<ip-address>
ssh-keyscan -H <host>,<ip-address> >> ~/.ssh/known_hosts
```

Generate fingerprint from public key

```bash
ssh-keygen -lf ~/.ssh/id_rsa.pub -E sha256 | awk '{print $2}'
```
