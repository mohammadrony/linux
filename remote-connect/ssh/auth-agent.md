# Auth Agent for SSH Client

Related information

- [I accidentally did ssh-add -d .. how do I re-add my key from authorized_keys?](https://askubuntu.com/questions/490095/i-accidentally-did-ssh-add-d-how-do-i-re-add-my-key-from-authorized-keys)

Check agent status

```sh
echo $SSH_AUTH_SOCK
echo $SSH_AGENT_PID
```

List all identities

```sh
ssh-add -l
```

Adding key to agent *for current session*

```sh
ssh-add ~/.ssh/id_ed25519
```

Test connection

```sh
ssh -T user@host
```

```sh
ssh -i ~/.ssh/id_ed25519 -T user@host
```

Kill current agent

```sh
eval $(ssh-agent -k)
```

Start new agent *for current session*

```sh
eval $(ssh-agent -s)
```

Clear known keys from agent

```sh
ssh-add -D
```
