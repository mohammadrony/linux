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
rsync -avzh -e ssh --progress --chown=USER:GROUP /foo user@host:/tmp/
```

```bash
rsync --ignore-existing -avzh -e ssh --progress /foo user@host:/tmp/ >> log.txt 2>&1
```
