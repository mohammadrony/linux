# SCP

Send Files

```sh
scp ~/my-file.txt user@host:~/
```

```sh
scp -i secret.pem ~/my-file.txt user@host:~/
```

Download Files

```sh
scp user@host:~/my-file.txt ~/
```

```sh
scp -i secret.pem user@host:~/my-file.txt ~/
```

Special use case

```sh
scp user@host:"~/my-files/*.txt" ~/my-files/
```

```sh
scp 'user@host:"~/my files/*.txt"' ~/my-files/
```

```sh
scp user1@host1:"~/my-files/*.txt" user2@host2:~/my-files/
```
