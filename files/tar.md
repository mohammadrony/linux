# Tar Archive

## Create

Create new archive

```sh
tar -cvf archive.tar file1 ...
```

```sh
tar -cvzf archive.tgz file1 ...
tar -cvzf archive.tar.gz file1 ...
```

## Extract

```sh
tar -xvf archive.tar
```

```sh
tar -xvzf archive.tgz
tar -xvzf archive.tar.gz
```

Extract specific file

```sh
tar -xvf archive.tar ./file1
```

Extract archive to a directory

```sh
mkdir -p /target/directory
tar -xvf archive.tar -C /target/directory
```

Extract by ignoring first level dir

```sh
mkdir -p /target/directory
tar -xvf archive.tar -C /target/directory --strip-components=1
```

## Read

```sh
tar -tvf archive.tar
```

## Modify

Add files to existing archive

```sh
tar -rvf archive.tar file1
```

Update existing file in archive

```sh
tar -uvf archive.tar file1
# cannot update .tar.gz file 
```

Delete files from archive

```sh
tar --delete -vf archive.tar file1
```
