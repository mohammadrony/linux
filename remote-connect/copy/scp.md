# SCP

Send Files

```bash
scp ~/my-file.txt user@host:~/
```

```bash
scp -i secret.pem ~/my-file.txt user@host:~/
```

Download Files

```bash
scp user@host:~/my-file.txt ~/
```

```bash
scp -i secret.pem user@host:~/my-file.txt ~/
```

Special use case

```bash
scp user@host:"~/my-files/*.txt" ~/my-files/
```

```bash
scp 'user@host:"~/my files/*.txt"' ~/my-files/
```

```bash
scp user1@host1:"~/my-files/*.txt" user2@host2:~/my-files/
```
