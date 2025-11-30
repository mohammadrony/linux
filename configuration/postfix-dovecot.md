# Dovecot in Postfix

## Dovecot setup

- [Postfix + Dovecot with multi-domain setup](https://gist.github.com/howyay/57982e6ba9eedd3a5662c518f1b985c7)
- [How To Set Up a Postfix E-Mail Server with Dovecot](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-postfix-e-mail-server-with-dovecot)

### Install Dovecot packages

```sh
sudo apt install -y dovecot-imapd dovecot-pop3d
```

### Start Dovecot service

```sh
sudo systemctl enable --now dovecot
sudo systemctl status dovecot
```

### Update Postfix configuration for Dovecot

Generate certificate

```sh
sudo openssl req -x509 -nodes -newkey rsa:2048 -days 3650 -keyout /etc/ssl/private/mail.example.com.key \
  -out /etc/ssl/certs/mail.example.com.crt -subj "/C=BD/ST=Dhaka/L=Dhaka/O=Security/OU=IT/CN=mail.example.com"
```

Copy let's encrypt certificate

```sh
sudo cp /etc/letsencrypt/live/mail.example.com/fullchain.pem /etc/ssl/certs/mail.example.com.crt
sudo cp /etc/letsencrypt/live/mail.example.com/privkey.pem  /etc/ssl/private/mail.example.com.key
```

```sh
sudo cp /etc/postfix/main.cf /etc/postfix/main.cf.bak
sudo vi /etc/postfix/main.cf
```

```conf
smtpd_banner = $myhostname ESMTP $mail_name (Ubuntu)
biff = no

append_dot_mydomain = no
readme_directory = no
compatibility_level = 3.6

smtpd_tls_cert_file=/etc/ssl/certs/mail.example.com.crt
smtpd_tls_key_file=/etc/ssl/private/mail.example.com.key
smtpd_use_tls=yes

smtp_tls_CApath=/etc/ssl/certs
smtp_tls_security_level=may

smtpd_tls_security_level=may
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache

smtpd_tls_protocols = !SSLv2, !SSLv3

myhostname = mail.example.com
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = /etc/mailname
mydestination = example.com, mail.example.com, localhost.example.com, localhost
relayhost = 
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
inet_protocols = all

local_recipient_maps = proxy:unix:passwd.byname $alias_maps
```

Reserved config for real certificate

```conf
# # TLS settings
# smtpd_tls_cert_file = /etc/ssl/certs/example.com.pem
# smtpd_tls_key_file = /etc/ssl/private/example.com.key
# smtpd_tls_security_level = encrypt
# smtp_tls_security_level = encrypt
# smtpd_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
# smtpd_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
# smtp_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
# smtp_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
# smtpd_tls_mandatory_ciphers = high
# smtpd_tls_auth_only = yes
```

### Update Postfix setup

```sh
sudo cp /etc/postfix/master.cf /etc/postfix/master.cf.orig
sudo vi /etc/postfix/master.cf
```

```conf
submission inet n       -       n       -       -       smtpd
  -o smtpd_sasl_type=dovecot
  -o smtpd_tls_wrappermode=no
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_sasl_path=private/auth
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o milter_macro_daemon_name=ORIGINATING
  -o smtpd_relay_restrictions=permit_mynetworks,permit_sasl_authenticated,reject
  -o smtpd_client_restrictions=permit_mynetworks,permit_sasl_authenticated,reject
```

### Update Dovecot configuration

```sh
sudo mv /etc/dovecot/dovecot.conf /etc/dovecot/dovecot.conf.orig
# empty file
sudo vi /etc/dovecot/dovecot.conf
```

```conf
disable_plaintext_auth = no
mail_privileged_group = mail
mail_location = mbox:~/mail:INBOX=/var/mail/%u

ssl=required
ssl_cert = </etc/ssl/certs/mail.example.com.crt
ssl_key = </etc/ssl/private/mail.example.com.key

userdb {
  driver = passwd
}
passdb {
  args = %s
  driver = pam
}

service auth {
  unix_listener /var/spool/postfix/private/auth {
    group = postfix
    mode = 0660
    user = postfix
  }
}

protocols = " imap"

namespace inbox {
  inbox = yes

  mailbox Trash {
    auto = subscribe
    special_use = \Trash
  }
  mailbox Sent {
    auto = subscribe
    special_use = \Sent
  }
  mailbox Drafts {
    auto = subscribe
    special_use = \Drafts
  }
  mailbox Spam {
    auto = subscribe
    special_use = \Junk
  }
  mailbox Archive {
    auto = subscribe
    special_use = \Archive
  }
}
```

Restart Services

```sh
sudo systemctl restart postfix
sudo systemctl restart dovecot
```

Status check

```sh
sudo systemctl status postfix
sudo systemctl status dovecot
```

## Send Email

```sh
mail <user>@example.com
> Cc: <enter>
> Subject: <Subject line>
> <Message body>
> ...
> ...
> ^D
```

```sh
echo "Subject: Test" | sendmail -v user@example.com
```

```sh
swaks --auth-user=user --auth-password=password --tls --server mail.example.com:587
```
