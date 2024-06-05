# SCP

Send Files

- `scp ~/my-file.txt user@host:~/`
- `scp -i secret.pem ~/my-file.txt user@host:~/`

Download Files

- `scp user@host:~/my-file.txt ~/`
- `scp -i secret.pem user@host:~/my-file.txt ~/`

Special use case

- `scp user@host:"~/my-files/*.txt" ~/my-files/`
- `scp 'user@host:"~/my files/*.txt"' ~/my-files/`
- `scp user1@host1:"~/my-files/*.txt" user2@host2:~/my-files/`
