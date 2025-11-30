# Github Actions

Generate key

```sh
ssh-keygen -t ed25519 -f ~/.ssh/github_actions
```

Add public key to authorized keys

```sh
cat github_actions.pub >> ~/.ssh/authorized_keys
```

Add private key to repository secrets

```sh
cat ~/.ssh/github_actions
```

Secret

| Name              | Value                                     |
|-------------------|-------------------------------------------|
| `SSH_PRIVATE_KEY` | *Output of previous command*              |
| `SSH_HOST`        | `<example.com>`                           |
| `SSH_USERNAME`    | `<user>`                                  |
| `KNOWN_HOSTS`     | `ssh-keyscan -t ed25519 -H <example.com>` |
