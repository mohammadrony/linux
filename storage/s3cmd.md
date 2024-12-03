# s3cmd

[How to Install s3cmd in Linux and Manage S3 Buckets](https://tecadmin.net/install-s3cmd-manage-amazon-s3-buckets/)

## Installation

Ubuntu

```bash
sudo apt install -y s3cmd
```

Source download [here](https://sourceforge.net/projects/s3tools/files/s3cmd/)

```bash
wget https://sourceforge.net/projects/s3tools/files/s3cmd/2.4.0/s3cmd-2.4.0.tar.gz
tar xzf s3cmd-2.4.0.tar.gz
```

```bash
cd s3cmd-2.4.0 
sudo python setup.py install
```

```bash
sudo cp s3cmd /usr/local/bin
```

## Usage

```bash
s3cmd
```

Configure

```bash
s3cmd --configure
```

Commands

```bash
s3cmd ls
```
