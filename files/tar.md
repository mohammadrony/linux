# Tar Archive

## Create

Create new archive

```bash
tar -cvf archive.tar file1 ...
```

```bash
tar -cvzf archive.tgz file1 ...
tar -cvzf archive.tar.gz file1 ...
```

## Extract

```bash
tar -xvf archive.tar
```

```bash
tar -xvzf archive.tgz
tar -xvzf archive.tar.gz
```

Extract specific file

```bash
tar -xvf archive.tar ./file1
```

Extract archive to a directory

```bash
mkdir -p /target/directory
tar -xvf archive.tar -C /target/directory
```

Extract by ignoring first level dir

```bash
mkdir -p /target/directory
tar -xvf archive.tar -C /target/directory --strip-components=1
```

## Read

```bash
tar -tvf archive.tar
```

## Modify

Add files to existing archive

```bash
tar -rvf archive.tar file1
```

Update existing file in archive

```bash
tar -uvf archive.tar file1
# cannot update .tar.gz file 
```

Delete files from archive

```bash
tar --delete -vf archive.tar file1
```
