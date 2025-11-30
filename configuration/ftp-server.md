# FTP Server

## Guide

- [Filezilla Server](https://filezilla-project.org/download.php?type=server)
- [vsftpd.conf](http://vsftpd.beasts.org/vsftpd_conf.html)

## Server Configuration

Install vsftpd

```sh
sudo apt install -y vsftpd
```

Start service

```sh
sudo systemctl enable --now vsftpd
sudo systemctl status vsftpd
```

Disable firewall

```sh
sudo systemctl disable --now ufw
# sudo ufw allow 20/tcp
# sudo ufw allow 21/tcp
# sudo ufw allow 5000:10000/tcp
```

Create admin user

```sh
sudo useradd -m -s /bin/bash admin
```

```sh
sudo passwd admin
# Password:
```

```sh
sudo chown admin:ftp /srv/ftp -R
```

Create read user

```sh
sudo useradd -m -s /bin/bash ftpuser
```

```sh
sudo passwd ftpuser
# Password:
```

Create config file backup

```sh
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
```

```sh
sudo vi /etc/vsftpd.conf
```

Update or uncomment in `/etc/vsftpd.conf` file

```conf
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=0002
chroot_local_user=YES
chroot_list_enable=YES
```

Add in `/etc/vsftpd.conf` file

```conf
pasv_min_port=5000
pasv_max_port=10000
local_root=/srv/ftp
allow_writeable_chroot=YES
```

Create chroot file

```sh
sudo touch /etc/vsftpd.chroot_list
```

Add user in `/etc/vsftpd.chroot_list` file to access `/` files

Generate SSL certificate

```sh
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
```

Update SSL configuration

```sh
sudo vi /etc/vsftpd.conf
```

Comment existing certificate

```conf
#rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
#rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
#ssl_enable=NO
```

Add new certificate

```conf
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
require_ssl_reuse=NO
ssl_ciphers=HIGH
```

Restart vsftpd service

```sh
sudo systemctl restart vsftpd
```

Deny SSH Login

```sh
sudo tee -a /etc/ssh/sshd_config << EOF
DenyUsers admin ftpuser
EOF
```

```sh
sudo systemctl restart ssh
```
