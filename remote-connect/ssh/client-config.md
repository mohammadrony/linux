# SSH Client Config

## Common config

Prefer password authentication

```sh
sudo vi /etc/ssh/ssh_config
```

```config
PreferredAuthentications password,publickey
```

## User config

Set ssh file for host

```sh
vi ~/.ssh/config
```

```config
Host example.com
  Hostname example.com
  User root
  IdentityFile ~/.ssh/id_rsa
  IdentitiesOnly yes
  AddKeysToAgent yes
```
