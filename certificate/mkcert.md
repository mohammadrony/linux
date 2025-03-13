# mkcert

```bash
sudo apt install -y libnss3-tools
```

Install local CA

```bash
mkcert -install
```

Generate certificate

```bash
mkcert example.com "*.example.com" localhost 127.0.0.1 ::1
```

Uninstall local CA

```bash
mkcert -uninstall
```
