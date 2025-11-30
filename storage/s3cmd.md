# s3cmd

[How to Install s3cmd in Linux and Manage S3 Buckets](https://tecadmin.net/install-s3cmd-manage-amazon-s3-buckets/)

## Installation

Ubuntu

```sh
sudo apt install -y s3cmd
```

Source download [here](https://sourceforge.net/projects/s3tools/files/s3cmd/)

```sh
wget https://sourceforge.net/projects/s3tools/files/s3cmd/2.4.0/s3cmd-2.4.0.tar.gz
tar xzf s3cmd-2.4.0.tar.gz
```

```sh
cd s3cmd-2.4.0 
sudo python setup.py install
```

```sh
sudo cp s3cmd /usr/local/bin
```

## Usage

```sh
s3cmd
```

Configure

```sh
s3cmd --configure
```

Commands

```sh
s3cmd ls
```
