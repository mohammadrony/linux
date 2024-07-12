# SSH Auth Agent for Client

Related information

- [I accidentally did ssh-add -d .. how do I re-add my key from authorized_keys?](https://askubuntu.com/questions/490095/i-accidentally-did-ssh-add-d-how-do-i-re-add-my-key-from-authorized-keys)

Check agent status

```bash
echo $SSH_AUTH_SOCK
echo $SSH_AGENT_PID
```

List all identities

```bash
ssh-add -l
```

Adding key to agent *for current session*

```bash
ssh-add ~/.ssh/ed25519
```

Test connection

```bash
ssh -T user@host
```

```bash
ssh -i ~/.ssh/ed25519 -T user@host
```

Kill current agent

```bash
eval $(ssh-agent -k)
```

Start new agent *for current session*

```bash
eval $(ssh-agent -s)
```

Clear known keys from agent

```bash
ssh-add -D
```
