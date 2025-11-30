# SSH Known Hosts

```sh
ssh -o StrictHostKeyChecking=no user@host
```

Remove host from known_hosts file

```sh
ssh-keygen -R <host>,<ip-address>
```

Add hosts to known_hosts

```sh
ssh-keyscan -H <host>,<ip-address>
```

```sh
ssh-keyscan -t rsa -H <host>
```

```sh
ssh-keyscan -H <host>,<ip-address> >> ~/.ssh/known_hosts
```
