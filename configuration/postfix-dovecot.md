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

### Generate SSL certificate

```bash
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/ssl/private/example.com.key -out /etc/ssl/certs/example.com.pem -subj "/C=BD/ST=Bangladesh/L=Dhaka/O=Company Name Ltd./OU=Organizational Unit/CN=example.com/streetAddress=Example 1/postalCode=1201"
```

### Update Postfix configuration for Dovecot

```bash
sudo vi /etc/postfix/main.cf

# Add
smtpd_tls_cert_file = /etc/ssl/certs/example.com.pem
smtpd_tls_key_file = /etc/ssl/private/example.com.key
smtpd_tls_security_level = encrypt
smtp_tls_security_level = encrypt
smtpd_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1

smtpd_sasl_type = dovecot
smtpd_sasl_path = private/auth
smtpd_sasl_auth_enable = yes
smtpd_sasl_security_options = noanonymous
smtpd_sasl_local_domain = $myhostname
smtpd_recipient_restrictions = permit_mynetworks,permit_auth_destination,permit_sasl_authenticated,reject
```

### Update Postfix setup

```bash
sudo cp /etc/postfix/master.cf /etc/postfix/master.cf.orig
sudo vi /etc/postfix/master.cf

# Update
submission inet n       -       -       -       -       smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_recipient_restrictions=permit_mynetworks,permit_sasl_authenticated,reject
```

### Update Dovecot configuration

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

# create and autosubscribe to some default folders
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

service auth {
      unix_listener /var/spool/postfix/private/auth {
      mode = 0660
      user = postfix
      group = postfix
    }
}

# set your certificate
ssl = required
ssl_cert = </etc/ssl/certs/example.com.pem
ssl_key = </etc/ssl/private/example.com.key
```

```bash
sudo usermod -aG ssl-cert postfix
```

```bash
sudo cp /etc/letsencrypt/live/mail.example.com/fullchain.pem /etc/ssl/certs/mail.example.com.crt
sudo cp /etc/letsencrypt/live/mail.example.com/privkey.pem  /etc/ssl/private/mail.example.com.key
```

### Restart Postfix and Dovecot services

```bash
sudo systemctl restart postfix dovecot
```

## Send Mail

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
