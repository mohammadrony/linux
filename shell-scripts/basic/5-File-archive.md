# File Archive with tar

Create new archive

```bash
tar -cvf my-files.tar file-list
```

Extract archive

```bash
tar -xvf my-files.tar
```

Add files to existing archive

```bash
tar -rvf my-files.tar file-list
```

Update existing file in archive

```bash
tar -uvf my-files.tar file-list
```

Delete files from archive

```bash
tar --delete -vf my-files.tar file-list
```
