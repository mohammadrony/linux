# Tar File Archive

## Create

Create new archive

```bash
tar -cvf my-files.tar file1 ...
```

## Extract

```bash
tar -xvf my-files.tar
```

Extract archive to a directory

```bash
mkdir files
tar -xvf my-files.tar -C files
```

Extract specific file

```bash
tar -xvf my-files.tar ./file1
```

## Read

```bash
tar -tvf my-files.tar
```

## Modify

Add files to existing archive

```bash
tar -rvf my-files.tar file1
```

Update existing file in archive

```bash
tar -uvf my-files.tar file1
```

Delete files from archive

```bash
tar --delete -vf my-files.tar file1
```
