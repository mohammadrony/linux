# Copy Files

## cp

```sh
cp source dest
```

```sh
cp -r source/* dest/
```

## cpio

```sh
cpio source dest
```

```sh
sudo cpio -iR USER:GROUP -F app.tar.gz
```

## rsync

Geeksforgeeks [documentaion](https://www.geeksforgeeks.org/rsync-command-in-linux-with-examples/).

```sh
rsync source dest
```

```sh
rsync --ignore-existing
````

```sh
rsync -avzh -e ssh --progress --chown=USER:GROUP /foo user@host:/tmp/
```

```sh
rsync --ignore-existing -avzh -e ssh --progress /foo user@host:/tmp/ >> log.txt 2>&1
```
