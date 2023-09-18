# Setting Mail server in Ubuntu 22

Tutorials

- [How To Install and Configure Postfix as a Send-Only SMTP Server on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-22-04)
- [Setup MAIL Server - Postfix (SMTP) - Dovecot (POP3/IMAP) - Mutt (Email Client) - Ubuntu](https://www.youtube.com/watch?v=ruD9bul7vDo)
- [Setup Mail Server on Linux with Multiple domain names](https://www.youtube.com/watch?v=Jlaq2fiSO9A)
- [Postfix SMTP, Dovecot POP IMAP and SSL/TLS](https://www.youtube.com/watch?v=XqLgbn1NXTg)

## Setup new domain for mail server

### Buy a new Domain

Goto any domain registrar and select your favorite 

### Domain record setup

Required entries in the DNS record

------------------------------------------------------------------------------------
| Type  | Name            | Content                                    | TTL value |
|-------|-----------------|--------------------------------------------|-----------|
| A     | mail            | 178.128.113.15                             | Auto      |
| MX    | @               | dev.dsinnovators.com                       | Auto      |
| TXT   | @               | `v=spf1 a mx -all`                         | Auto      |
| TXT   | dkim._domainkey | "v=DKIM1; h=sha256; k=rsa;p=Encrypted_key" | Auto      |
| CNAME | autodiscover    | dev.dsinnovators.com                       | Auto      |
| CNAME | autoconfig      | dev.dsinnovators.com                       | Auto      |
| TXT   | _dmarc          | "v=DMARC1; p=quarantine"                   | Auto      |
------------------------------------------------------------------------------------

*Low value in priority means higher the priority.*

## Setup Mail server

### Set server domain name

```bash
sudo apt -y update; sudo apt -y upgrade
sudo echo '<your.domain.com>' > /etc/hostname
sudo sed -i 's/\(127.0.0.1\).*/\1 <your.domain.com>/' /etc/hosts
sudo reboot now
```

### Firewall rule update

```bash
sudo apt install -y ufw
sudu ufw default deny incomoing
sudo ufw default allow outgoins
sudo ufw allow 22,25,80,110,143,443,465,587,993,995,4190/tcp
sudo ufw enable
```

## Setup Mail Transfer Agent

### Install required packages

```bash
sudo apt install -y mailutils
sudo apt install -y postfix
```

### Update Postfix configuration

```bash
sudo dpkg-reconfigure postfix
> Internet Site
> System mail name: <mail.domain.com>
> Recipient for root: <enter>
> Other destinations to accept mail: <mail.domain.com>, localhost.<domain.com>, <domain.com>
> Force synchronous updates: <No>
> Local networks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
> Mailbox size limit: 0
> Local address extension character: +
> Internet protocols to use: all
```

Custom configuration

```bash
sudo vi /etc/postfix/main.cf

# Update
relayhost = smtp.gmail.com:587
smtp_tls_security_level=encrypt

home_mailbox = Maildir/
smtp_tls_note_starttls_offer = yes
smtpd_tls_loglevel = 1
smtpd_tls_received_header = yes
smtpd_tls_CAfile = /etc/ssl/certs/cacert.pem
smtpd_sasl_type = dovecot
smtpd_sasl_path = private/auth
smtpd_sasl_local_domain = 
smtpd_sasl_security_options = noanonymous,noplaintext
smtpd_sasl_tls_security_options = noanonymous
broken_sasl_auth_clients = yes
smtpd_sasl_auth_enable = yes
smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination
```

### Reload Postfix

```bash
sudo systemctl reload postfix
postconf -n
telnet gmail-smtp-in.l.google.com 25
```

## Setup Mail Delivery Agent

### Install required packages

```bash
sudo apt install -y dovecot-imapd dovecot-pop3d dovecot-core
```

### Update Dovecot configuration

```bash
sudo sed -i 's/\(^mail_location.*\)/#\1/' /etc/dovecot/conf.d/10-mail.conf
sudo sed -i 's/^#\s*\(mail_location = maildir:~\/Maildir\)/\1/' /etc/dovecot/conf.d/10-mail.conf
```

```bash
sudo vi /etc/dovecot/conf.d/10-mail.conf

# Update
mail_location = maildir:~/Maildir
```

```bash
sudo vi /etc/dovecot/conf.d/10-master.conf

# Update
unix_listener /var/spool/postfix/private/auth {
  mode = 0666
  user = postfix
  group = postfix
}
```

```bash
sudo vi /etc/dovecot/dovecot.conf

# Update
listen = *, ::
```
### Reload Dovecot

```bash
sudo systemctl reload dovecot
doveconf -n
```

### Setup Maildir directory

```bash
cd /etc/skel
sudo mkdir -p Maildir/{cur,new,tmp} 
```

```bash
sudo vi /etc/profile.d/mail.sh

# Add
export MAIL=$HOME/Maildir
```

## Setup Mail client

### Install Mutt client

```bash
sudo apt install -y mutt
```

### Update Mutt configuration

```bash
cd /etc/skel
sudo mkdir .mutt
cd .mutt
sudo cat > muttrc << EOF
set imap_user = ""
set imap_pass = ""

set folder = imaps://mail
set spoolfile = +INBOX

set realname = ''
set from = "$imap_user"
set use_from = yes

set sort=reverse-date

mailboxes = INBOX

set timeout=1

set sidebar_visible = yes

source ~/.mutt/mutt_colors
EOF

sudo cat > mutt_colors << EOF
# Colours for items in the index
color index brightcyan black ~N
# Hmm, don't like this.
# color index brightgreen black "~N (~x byers.world)|(~x byers.x)|(~x langly.levallois123.axialys.net)|(~x the.earth.li)"
color index brightyellow black ~F
color index black green ~T
color index brightred black ~D
mono index bold ~N
mono index bold ~F
mono index bold ~T
mono index bold ~D

# Highlights inside the body of a message.

# URLs
color body brightgreen black "(http|ftp|news|telnet|finger)://[^ \"\t\r\n]*"
color body brightgreen black "mailto:[-a-z_0-9.]+@[-a-z_0-9.]+"
mono body bold "(http|ftp|news|telnet|finger)://[^ \"\t\r\n]*"
mono body bold "mailto:[-a-z_0-9.]+@[-a-z_0-9.]+"

# email addresses
color body brightgreen black "[-a-z_0-9.%$]+@[-a-z_0-9.]+\\.[-a-z][-a-z]+"
mono body bold "[-a-z_0-9.%$]+@[-a-z_0-9.]+\\.[-a-z][-a-z]+"

# header
color header green black "^from:"
color header green black "^to:"
color header green black "^cc:"
color header green black "^date:"
color header yellow black "^newsgroups:"
color header yellow black "^reply-to:"
# color header brightcyan black "^subject:"
color header yellow black "^subject:"
color header red black "^x-spam-rule:"
color header green black "^x-mailer:"
color header yellow black "^message-id:"
color header yellow black "^Organization:"
color header yellow black "^Organisation:"
color header yellow black "^User-Agent:"
color header yellow black "^message-id: .*pine"
color header yellow black "^X-Fnord:"
color header yellow black "^X-WebTV-Stationery:"
color header yellow black "^X-Message-Flag:"
color header yellow black "^X-Spam-Status:"
color header yellow black "^X-SpamProbe:"
color header red black "^X-SpamProbe: SPAM"

# Coloring quoted text - coloring the first 7 levels:
color quoted cyan black
color quoted1 yellow black
color quoted2 red black
color quoted3 green black
color quoted4 cyan black
color quoted5 yellow black
color quoted6 red black
color quoted7 green black


# Default color definitions
#color hdrdefault white green
color signature brightmagenta black
color indicator black cyan
color attachment black green
color error red black
color message white black
color search brightwhite magenta
# color status brightyellow blue
color status blue black
color tree brightblue black
color normal white black
color tilde green black
color bold brightyellow black
color underline magenta black
color markers brightcyan black

# Colour definitions when on a mono screen
mono bold bold
mono underline underline
mono indicator reverse
EOF
sudo chmod 700 -R /etc/skel
```

### Create Mail user

```bash
sudo adduser --gecos "" user1
sudo adduser --gecos "" user2
``` 

## SSL certificate setup

Thank you.
