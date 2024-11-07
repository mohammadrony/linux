# Dovecot in Postfix

## Dovecot setup

- [Postfix + Dovecot with multi-domain setup](https://gist.github.com/howyay/57982e6ba9eedd3a5662c518f1b985c7)
- [Debian 9 Mail Server: Postfix and Dovecot](https://scaron.info/blog/debian-mail-postfix-dovecot.html)

### Install Dovecot packages

```bash
sudo apt -y install dovecot-imapd dovecot-pop3d
```

### Start Dovecot service

```bash
sudo systemctl enable --now dovecot
sudo systemctl status dovecot
```

### Update Postfix configuration for Dovecot

Copy certificate

```bash
sudo cp /etc/letsencrypt/live/mail.example.com/fullchain.pem /etc/ssl/certs/mail.example.com.crt
sudo cp /etc/letsencrypt/live/mail.example.com/privkey.pem  /etc/ssl/private/mail.example.com.key
```

```bash
sudo cp /etc/postfix/main.cf /etc/postfix/main.cf.bak
sudo vi /etc/postfix/main.cf

```conf
# Enable submission port
submission_enable = yes

# TLS settings
smtpd_tls_cert_file = /etc/ssl/certs/example.com.pem
smtpd_tls_key_file = /etc/ssl/private/example.com.key
smtpd_tls_security_level = encrypt
smtp_tls_security_level = encrypt
smtpd_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_mandatory_ciphers = high
smtpd_tls_auth_only = yes

smtpd_sasl_type = dovecot
smtpd_sasl_path = private/auth
smtpd_sasl_auth_enable = yes
smtpd_sasl_security_options = noanonymous
smtpd_sasl_local_domain = $myhostname
broken_sasl_auth_clients = yes
```

### Update Postfix setup

```bash
sudo cp /etc/postfix/master.cf /etc/postfix/master.cf.orig
sudo vi /etc/postfix/master.cf
```

```conf
submission inet n       -       n       -       -       smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_sasl_type=dovecot
  -o smtpd_sasl_path=private/auth
  -o smtpd_client_restrictions=permit_sasl_authenticated,reject
  -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
```

### Update Dovecot configuration

```bash
sudo vi /etc/dovecot/conf.d/10-master.conf
```

```conf
service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
    user = postfix
    group = postfix
  }
}

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

### Restart Postfix and Dovecot services

```bash
sudo vi /etc/dovecot/conf.d/10-auth.conf
```

```conf
auth_mechanisms = plain login
```

### Restart Services

```bash
sudo systemctl restart postfix
sudo systemctl restart dovecot
```

Status check

```bash
sudo systemctl status postfix
sudo systemctl status dovecot
```

## Others

```bash
sudo cp /etc/dovecot/dovecot.conf /etc/dovecot/dovecot.conf.orig
sudo vi /etc/dovecot/dovecot.conf

# Add
#set mailbox location to Maildir style
disable_plaintext_auth = yes
mail_privileged_group = mail
mail_location = ~/Maildir

userdb {
      driver = passwd
}

passdb {
     args = %s
     driver = pam
}

protocols = "imap"
```

## Send Email

```bash
mail <user>@example.com
> Cc: <enter>
> Subject: <Subject line>
> <Message body>
> ...
> ...
> ^D
```

```bash
echo "Subject: Test" | sendmail -v user@example.com
```

```bash
swaks --auth-user=user --auth-password=password --tls --server mail.example.com:587
```
