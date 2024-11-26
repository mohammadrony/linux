# SSH Server Config

Copy original config

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
```

## Change configuration

```bash
sudo vi /etc/ssh/sshd_config
```

- Allow public key authentication

  ```txt
  PubkeyAuthentication yes
  AuthorizedKeysFile .ssh/authorized_keys
  ```

- Allow root login

  ```txt
  PermitRootLogin yes
  ```

- Allow selected user

  ```txt
  AllowUsers root <user>
  ```

## Restart SSH service

```bash
sudo systemctl reload ssh
```
