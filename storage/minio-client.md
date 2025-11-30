# Minio Client

## Installation

```sh
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/.minio-binaries/mc

chmod +x $HOME/.minio-binaries/mc
```

```sh
# Update ~/.bashrc and ~/.zshrc
export PATH=$PATH:$HOME/.minio-binaries/
```

## Usage

```sh
mc --help
```

### Alias

Add Minio Host

```sh
mc alias set MINIO $MINIO_HOST $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
```

List targets

```sh
mc alias list
```

Remove target

```sh
mc alias remove MINIO
```

### Admin

Minio information

```sh
mc admin info MINIO
```

### List

```sh
mc ls
```

```sh
mc ls MINIO/bucket
```

### Bucket

Create bucket

```sh
mc mb MINIO/bucket
```

Remove bucket

```sh
mc rb MINIO/bucket
```

### Remove

Test run remove files

```sh
mc rm --dry-run MINIO/bucket/a.txt
```

Remove files

```sh
mc rm MINIO/bucket/a.txt
```

Remove files recursively

```sh
mc rm -r --force MINIO/bucket/files
```

### Copy

Copy files locally

```sh
mc cp a.txt b.txt
```

Copy local to MINIO server

```sh
mc cp -r files MINIO/bucket/
```

```sh
mc cp a.txt MINIO/bucket/b.txt
```

Copy file between servers

```sh
mc cp -r MINIO1/bucket1 MINIO2/bucket2/files/
```

```sh
mc cp MINIO1/bucket1/a.txt MINIO2/bucket2/b.txt
```

### Trace

```sh
mc admin trace --help
```

```sh
mc admin trace MINIO
```

```sh
mc admin trace -v MINIO > MINIO.log &
```
