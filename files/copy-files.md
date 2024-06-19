# Copy Files

## cp

```bash
cp source dest
```

```bash
cp -r source/* dest/
```

## cpio

```bash
cpio source dest
```

```bash
sudo cpio -iR USER:GROUP -F app.tar.gz
```

## rsync

Geeksforgeeks [documentaion](https://www.geeksforgeeks.org/rsync-command-in-linux-with-examples/).

```bash
rsync source dest
```

```bash
rsync --ignore-existing
````

```bash
rsync -avhe ssh --chown=USER:GROUP /foo user@remote-host:/tmp/
```
