# mkcert

```sh
sudo apt install -y libnss3-tools
```

Install local CA

```sh
mkcert -install
```

Generate certificate

```sh
mkcert example.com "*.example.com" localhost 127.0.0.1 ::1
```

Uninstall local CA

```sh
mkcert -uninstall
```
