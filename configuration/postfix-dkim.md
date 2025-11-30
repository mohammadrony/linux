# Mail Transfer Agent setup

## Setup mail server domain

### Buy a new Domain

Goto any domain registrar and acquire your domain. Some of the popular domain registrer are,

- [Freenom](https://www.freenom.com)
- [Hostinger](https://www.hostinger.com)
- [GoDaddy](https://www.godaddy.com)

### Domain record setup

DNS record entries for SPAM protection

| Type  | Name                | Content                                                                                                             | TTL value |
|-------|---------------------|---------------------------------------------------------------------------------------------------------------------|-----------|
| A     | mail                | mail.server.ip.address                                                                                              | Auto      |
| MX    | @                   | mail.example.com                                                                                                    | Auto      |
| TXT   | @                   | v=spf1 mx ~all                                                                                                      | Auto      |
| TXT   | default._domainkey  | v=DKIM1; h=sha256; k=rsa; p=Encrypted_key                                                                           | Auto      |
| TXT   | _dmarc              | v=DMARC1; p=quarantine; aspf=r; sp=none; rua=mailto:dmarc@example.com; ruf=mailto:dmarc@example.com; fo=1; pct=100  | Auto      |
| CNAME | autodiscover        | mail.example.com                                                                                                    | Auto      |
| CNAME | autoconfig          | mail.example.com                                                                                                    | Auto      |

*Low value in priority means higher the priority.*

## Initial server setup

### Setup server name

```sh
sudo apt update; sudo apt upgrade -y
sudo hostnamectl set-hostname mail.example.com
sudo sed -i '/^127.0.0.1\s*localhost/a 127.0.0.1 mail.example.com' /etc/hosts
sudo sysctl kernel.hostname=mail.example.com
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

## Initial Postfix and DKIM setup

### Install required packages

```sh
sudo apt install -y mailutils
```

### Setup Postfix configuration

```sh
sudo dpkg-reconfigure postfix
> Internet Site
> System mail name: example.com
> Recipient for root: <enter>
> Other destinations to accept mail: example.com, mail.example.com, localhost.example.com, localhost
> Force synchronous updates: <No>
> Local networks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
> Mailbox size limit: 0
> Local address extension character: +
> Internet protocols to use: all
```

Custom configuration

```sh
sudo cp /etc/postfix/main.cf /etc/postfix/main.cf.orig
sudo vi /etc/postfix/main.cf

# Update
myorigin = /etc/mailname
home_mailbox = Maildir/
```

```sh
sudo vi /etc/mailname

# Add
example.com
```

### Restart Postfix

```sh
sudo systemctl restart postfix
postconf -n
```

### Verify server connection

```sh
telnet smtp.google.com 25
> ehlo smtp.google.com
> quit
```

### Setup Mail Aliases

```sh
sudo vi /etc/aliases
```

```txt
dmarc:        postmaster
postmaster:   root
root:         sysadmin@example.com
USER:         user@example.com
noreply:      /dev/null
```

### Reload Aliases

```sh
sudo newaliases
```

## DKIM key setup

### Install DKIM packages

```sh
sudo apt install -y opendkim opendkim-tools
```

### Add Postfix user to OpenDKIM group

```sh
sudo usermod -aG opendkim postfix
```

### Setup OpenDKIM key directory

```sh
sudo mkdir -p /etc/opendkim/keys
sudo chown -R opendkim:opendkim /etc/opendkim
sudo chmod  744 /etc/opendkim/keys
```

### Generate DKIM key for domain

```sh
sudo mkdir /etc/opendkim/keys/example.com
sudo opendkim-genkey -b 2048 -d example.com -D /etc/opendkim/keys/example.com -s default -v
sudo chown opendkim:opendkim /etc/opendkim/keys/example.com/default.private
```

### Update DKIM key in DNS record

```sh
sudo cat /etc/opendkim/keys/example.com/default.txt

# Output
default._domainkey IN TXT ("v=DKIM1; h=sha256; k=rsa; p=Encrypted_key");
```

Remove extra `"` from key and save in **DNS record**

### Update DKIM configuration

```sh
sudo cp /etc/opendkim.conf /etc/opendkim.conf.orig
sudo vi /etc/opendkim.conf

# Update
LogWhy                  yes
Mode                    sv
SubDomains              no

# Add
AutoRestart             yes
AutoRestartRate         10/1M
Background              yes
DNSTimeout              5
SignatureAlgorithm      rsa-sha256

# End of the file
KeyTable                refile:/etc/opendkim/key.table
SigningTable            refile:/etc/opendkim/signing.table
ExternalIgnoreList      /etc/opendkim/trusted.hosts
InternalHosts           /etc/opendkim/trusted.hosts
```

## Additional DKIM configuration

### Update Signing table

```sh
sudo tee -a /etc/opendkim/signing.table << EOF
*@example.com   default._domainkey.example.com
*@*.example.com default._domainkey.example.com
EOF
```

### Update Key table

```sh
sudo tee -a /etc/opendkim/key.table << EOF
default._domainkey.example.com  example.com:default:/etc/opendkim/keys/example.com/default.private
EOF
```

### Update hosts

```sh
sudo tee -a /etc/opendkim/trusted.hosts << EOF
127.0.0.1
localhost
.example.com
EOF
```

### Restart OpenDKIM

```sh
sudo systemctl restart opendkim
```

## Configure Postfix With OpenDKIM and Milter

### Update socket file configuration

```sh
sudo mkdir /var/spool/postfix/opendkim
sudo chown opendkim:postfix /var/spool/postfix/opendkim
```

```sh
sudo cp /etc/default/opendkim /etc/default/opendkim.orig
sudo vi /etc/default/opendkim

# Update
SOCKET="local:/var/spool/postfix/opendkim/opendkim.sock"
```

### Update opendkim configuration

```sh
# check backup copy
sudo vi /etc/opendkim.conf

# Update
Socket    local:/var/spool/postfix/opendkim/opendkim.sock
```

### Update Postfix configuration

```sh
# check backup copy
sudo vi /etc/postfix/main.cf

# Add
# Milter configuration
milter_default_action = accept
milter_protocol = 6
smtpd_milters = local:opendkim/opendkim.sock
non_smtpd_milters = $smtpd_milters
```

### Update services

```sh
sudo systemctl disable --now apparmor
```

```sh
sudo systemctl restart opendkim
```

```sh
sudo chmod 777 /var/spool/postfix/opendkim/opendkim.sock
```

```sh
sudo systemctl restart postfix
```

### Verify the DNS record

```sh
host -t TXT example.com
host -t TXT _dmarc.example.com
host -t TXT default._domainkey.example.com
```

```sh
sudo opendkim-testkey -d example.com -s default -vvv
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

Sendmail

```sh
echo "Subject: Test" | sendmail -v user@example.com
```
