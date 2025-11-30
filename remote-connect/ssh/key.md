# SSH Key

Generate key

```sh
ssh-keygen
```

```sh
ssh-keygen -t rsa -f ~/.ssh/id_rsa
```

```sh
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
```

Copy SSH key to remote host

```sh
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
```

Generate fingerprint from public key

```sh
ssh-keygen -lf ~/.ssh/id_rsa.pub -E sha256 | awk '{print $2}'
```
