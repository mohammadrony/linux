# SSH Config

Set ssh file for host

```bash
vi ~/.ssh/config
```

```config
Host example.com
  Hostname example.com
  IdentityFile ~/.ssh/id_rsa
  IdentitiesOnly yes
  AddKeysToAgent yes
```
