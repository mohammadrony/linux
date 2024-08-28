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
mc ls MINIO/bucket/
```

### Copy

Copy file locally

```bash
mc cp file1.txt file2.txt
```

Copy local file to MINIO server

```bash
mc cp file1.txt MINIO/bucket/file.txt
```

Copy files from one to another server

```bash
mc cp MINIO1/bucket1/file1.txt MINIO2/bucket2/file2.txt
```
