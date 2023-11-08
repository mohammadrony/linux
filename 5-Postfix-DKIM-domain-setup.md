# Setting Mail server in Ubuntu 22

## Setup mail server domain

### Buy a new Domain

Goto any domain registrar and select your favorite domain. Some of the popular domain registrer are,

- [Freenom](https://www.freenom.com)
- [Hostinger](https://www.hostinger.com)
- [GoDaddy](https://www.godaddy.com)

### Domain record setup

DNS record entries for SPAM protection

---------------------------------------------------------------------------------------------------------------------
| Type  | Name            | Content                                                                     | TTL value |
|-------|-----------------|-----------------------------------------------------------------------------|-----------|
| A     | mail            | mail.server.ip.address                                                      | Auto      |
| MX    | @               | mail.example.com                                                             | Auto      |
| TXT   | @               | `v=spf1 mx ~all`                                                          | Auto      |
| TXT   | dkim._domainkey | "v=DKIM1; h=sha256; k=rsa; p=Encrypted_key"                                 | Auto      |
| TXT   | _dmarc          | "v=DMARC1; p=quarantine; aspf=r; sp=none; rua=mailto:<dmarc@example.com>; ruf=mailto:<dmarc@example.com>; fo=1; pct=100" | Auto      |
| CNAME | autodiscover    | mail.example.com                                                             | Auto      |
| CNAME | autoconfig      | mail.example.com                                                             | Auto      |
---------------------------------------------------------------------------------------------------------------------

*Low value in priority means higher the priority.*

## Initial server setup

### Setup server name

```bash
sudo apt -y update; sudo apt -y upgrade
sudo echo 'mail.example.com' > /etc/hostname
sudo sed -i '/^127.0.0.1\s*localhost/a 127.0.0.1\tmail.example.com' /etc/hosts
sudo sysctl kernel.hostname=mail.example.com
sudo timedatectl set-timezone Asia/Dhaka
sudo reboot now
```

## Initial Postfix and DKIM setup

### Install required packages

```bash
sudo apt install -y mailutils
```

### Setup Postfix configuration

```bash
sudo dpkg-reconfigure postfix
> Internet Site
> System mail name: mail.example.com
> Recipient for root: <enter>
> Other destinations to accept mail: mail.example.com, example.com, localhost.example.com, localhost
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
home_mailbox = Maildir/
masquerade_domains = example.com
```

### Reload Postfix

```bash
sudo systemctl restart postfix
postconf -n
```

### Verify server connection

```bash
telnet smtp.google.com 25
> ehlo smtp.google.com
```

### Setup Mail Aliases

```bash
sudo vi /etc/aliases

# Add
dmarc: postmaster
postmaster: root
app: root
USER: root
root: sysadmin@example.com
noreply: /dev/null
no-reply: /dev/null
```

### Reload Aliases

```bash
sudo newaliases
```

## DKIM key setup

### Install DKIM packages

```bash
sudo apt install -y opendkim opendkim-tools
```

### Add Postfix user to OpenDKIM group

```bash
sudo usermod -aG opendkim postfix
```

### Setup OpenDKIM key directory

```bash
sudo mkdir -p /etc/opendkim/keys
sudo chown -R opendkim:opendkim /etc/opendkim
sudo chmod  744 /etc/opendkim/keys
```

### Generate DKIM key for domain

```bash
sudo mkdir /etc/opendkim/keys/example.com
sudo opendkim-genkey -b 2048 -d example.com -D /etc/opendkim/keys/example.com -s default -v
sudo chown opendkim:opendkim /etc/opendkim/keys/example.com/default.private
```

### Update DKIM key in DNS record

```bash
sudo cat /etc/opendkim/keys/example.com/default.txt

# Output
default._domainkey IN TXT ("v=DKIM1; h=sha256; k=rsa; p=Encrypted_key");
```

### Verify the DNS record

```bash
sudo opendkim-testkey -d example.com -s default -vvv
```

### Update DKIM configuration

```bash
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

OR

```bash
sudo sed -i 's/^#\(LogWhy\s*\)no/\1yes/' /etc/opendkim.conf
sudo sed -i 's/^#\(Mode\s*sv\)/\1/' /etc/opendkim.conf
sudo sed -i 's/^#\(SubDomains\s*no\)/\1/' /etc/opendkim.conf

sudo sed -i '18i AutoRestart\t\tyes\nAutoRestartRate\t\t10/1M\nBackground\t\tyes\nDNSTimeout\t\t5\nSignatureAlgorithm\trsa-sha256\n' /etc/opendkim.conf
sudo sed -i '$ a KeyTable\t\trefile:/etc/opendkim/key.table\nSigningTable\t\trefile:/etc/opendkim/signing.table\nExternalIgnoreList\t/etc/opendkim/trusted.hosts\nInternalHosts\t\t/etc/opendkim/trusted.hosts' /etc/opendkim.conf
```

## Additional DKIM configuration

### Update Signing table

```bash
sudo vi /etc/opendkim/signing.table

# Add
*@example.com   default._domainkey.example.com
*@*.example.com default._domainkey.example.com
```

OR

```bash
sudo touch /etc/opendkim/signing.table

sudo awk -i inplace 'BEGINFILE {print "*@example.com\t\tdefault._domainkey.example.com\n*@*.example.com\tdefault._domainkey.example.com"}' /etc/opendkim/signing.table

cat /etc/opendkim/signing.table
```

### Update Key table

```bash
sudo vi /etc/opendkim/key.table

# Add
default._domainkey.example.com  example.com:default:/etc/opendkim/keys/example.com/default.private
```

Or

```bash
sudo touch /etc/opendkim/key.table

sudo awk -i inplace 'BEGINFILE {print "default._domainkey.example.com\texample.com:default:/etc/opendkim/keys/example.com/default.private"}' /etc/opendkim/key.table

cat /etc/opendkim/key.table
```

### Update hosts

```bash
sudo vi /etc/opendkim/trusted.hosts

# Add
127.0.0.1
localhost
.example.com
```

Or

```bash
sudo touch /etc/opendkim/trusted.hosts

sudo awk -i inplace 'BEGINFILE {print "127.0.0.1\nlocalhost\n\n.example.com"}' /etc/opendkim/trusted.hosts

cat /etc/opendkim/trusted.hosts
```

### Restart OpenDKIM

```bash
sudo systemctl restart opendkim
```

## Configure Postfix With OpenDKIM

### Update socket file configuration

```bash
sudo mkdir /var/spool/postfix/opendkim
sudo chown opendkim:postfix /var/spool/postfix/opendkim
```

```bash
sudo vi /etc/default/opendkim

# Update
SOCKET="local:/var/spool/postfix/opendkim/opendkim.sock"
```

Or

```bash
sudo sed -i 's/\(^SOCKET=local:$RUNDIR\/opendkim.sock\)/#\1/' /etc/default/opendkim
sudo sed -i '20a SOCKET=local:/var/spool/postfix/opendkim/opendkim.sock' /etc/default/opendkim
```

### Update opendkim configuration

```bash
sudo vi /etc/opendkim.conf

# Update
Socket    local:/var/spool/postfix/opendkim/opendkim.sock
```

Or

```bash
sudo sed -i 's/\(Socket\s*local:\/run\/opendkim\/opendkim.sock\)/#\1/' /etc/opendkim.conf
sudo sed -i 's/#\(Socket\s*local:\/var\/spool\/postfix\/opendkim\/opendkim.sock\)/\1/' /etc/opendkim.conf
```

### Update Postfix configuration

```bash
sudo vi /etc/postfix/main.cf

# Add
# Milter configuration
milter_default_action = accept
milter_protocol = 6
smtpd_milters = local:opendkim/opendkim.sock
# smtpd_milters = local:/var/spool/postfix/opendkim/opendkim.sock
non_smtpd_milters = $smtpd_milters
```

Or

```bash
sudo sed -i '$ a # Milter configuration\nmilter_default_action = accept\nmilter_protocol = 6\nsmtpd_milters = local:opendkim/opendkim.sock\nnon_smtpd_milters = $smtpd_milters' /etc/postfix/main.cf
```

### Restart services

```bash
sudo systemctl restart opendkim
sudo systemctl restart postfix
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

Thank you.
