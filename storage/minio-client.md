# Minio Client

## Installation

```bash
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/.minio-binaries/mc

chmod +x $HOME/.minio-binaries/mc
```

```bash
# Update ~/.bashrc and ~/.zshrc
export PATH=$PATH:$HOME/.minio-binaries/
```

## Usage

```bash
mc --help
```

### Alias

Add Minio Host

```bash
mc alias set MINIO $MINIO_HOST $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
```

List targets

```bash
mc alias list
```

Remove target

```bash
mc alias remove MINIO
```

### Admin

```bash
mc admin info MINIO
```

### List

```bash
mc ls
```

```bash
mc ls MINIO/bucket
```

### Bucket

Create bucket

```bash
mc mb MINIO/bucket
```

Remove bucket

```bash
mc rb MINIO/bucket
```

### Remove

Test run remove files

```bash
mc rm --dry-run MINIO/bucket/a.txt
```

Remove files

```bash
mc rm MINIO/bucket/a.txt
```

Remove files recursively

```bash
mc rm -r --force MINIO/bucket/files
```

### Copy

Copy files locally

```bash
mc cp a.txt b.txt
```

Copy local to MINIO server

```bash
mc cp -r files MINIO/bucket/
```

```bash
mc cp a.txt MINIO/bucket/b.txt
```

Copy file between servers

```bash
mc cp -r MINIO1/bucket1 MINIO2/bucket2/files/
```

```bash
mc cp MINIO1/bucket1/a.txt MINIO2/bucket2/b.txt
```
