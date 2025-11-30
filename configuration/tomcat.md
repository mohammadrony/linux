# Tomcat

## Guide

- [Install Tomcat 9 on Ubuntu 24](https://linuxgenie.net/install-tomcat-ubuntu-24-04/)
- [Install Tomcat 9 on Ubuntu 20](https://linuxize.com/post/how-to-install-tomcat-9-on-ubuntu-20-04/)

## Custom Installation

Create tomcat user

```sh
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
```

Download and extract tomcat binary

```sh
cd /tmp

curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.90/bin/apache-tomcat-9.0.90.tar.gz # version 9
# curl -O https://downloads.apache.org/tomcat/tomcat-10/v10.1.25/bin/apache-tomcat-10.1.25.tar.gz # version 10
# curl -O https://downloads.apache.org/tomcat/tomcat-11/v11.0.0-M21/bin/apache-tomcat-11.0.0-M21.tar.gz # version 11

sudo mkdir /opt/tomcat
sudo tar xzvf /tmp/apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
```

Update file permission

```sh
sudo chown tomcat:tomcat /opt/tomcat -R
sudo chmod -R g+rx /opt/tomcat/conf
```

Find Java Home

```sh
dirname $(dirname $(readlink -f $(which java)))
```

Create tomcat service

```sh
sudo tee /etc/systemd/system/tomcat.service << EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always
WorkingDirectory=/opt/tomcat

Environment=JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_Home=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
# 4GB RAM 2 CPU
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseG1GC -XX:ParallelGCThreads=2 -XX:MaxGCPauseMillis=100 -XX:+HeapDumpOnOutOfMemoryError'
Environment='JAVA_OPTS=-Dawt.headless=true -Djava.security.egd=file:/dev/v/urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF
```

Start the service

```sh
sudo systemctl daemon-reload

# cd /opt/tomcat/bin
# sudo ./startup.sh run

sudo systemctl enable --now tomcat
sudo systemctl status tomcat
```

Create tomcat user applications account

```sh
sudo vi /opt/tomcat/conf/tomcat-users.xml
```

Password: `1D5dof06su`

- user manager can access only the manager section.
- user admin can access manager and admin section both.

```xml
<tomcat-users ...>
  <role rolename="manager-gui" />
  <user username="manager" password="tomcat2024" roles="manager-gui" />

  <role rolename="admin-gui" />
  <user username="admin" password="tomcat2024" roles="manager-gui,admin-gui" />
</tomcat-users>
```

Allow remote access to manager and host manager ui. *(By default tomcat is configured to access these pages from localhost only)*

```sh
sudo vi /opt/tomcat/webapps/manager/META-INF/context.xml
```

```sh
sudo vi /opt/tomcat/webapps/host-manager/META-INF/context.xml
```

Update following configuration to access from anywhere

```xml
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor" sameSiteCookies="strict" />
  <!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
  ...
</Context>
```

Update following configuration to access from specific ip address (i.e. `80.80.80.80`)

```xml
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor" sameSiteCookies="strict" />
  <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1|80.80.80.80" />
  ...
</Context>
```

Log rotation

```sh
sudo mkdir -p /opt/tomcat/logs/archive
sudo chown tomcat:tomcat /opt/tomcat/logs/archive
sudo chmod 755 /opt/tomcat/logs/archive
```

```sh
sudo vi /etc/logrotate.d/tomcat
```

```txt
/opt/tomcat/logs/catalina.out.7 {
  rotate 30
  missingok
  notifempty
  compress
  dateext
  dateyesterday
  dateformat -%Y-%m-%d
  create 0644 tomcat tomcat
  olddir /opt/tomcat/logs/archive
}

/opt/tomcat/logs/catalina.out {
  daily
  rotate 7
  missingok
  notifempty
  create 0644 tomcat tomcat
  sharedscripts
  postrotate
      /bin/kill -USR1 $(cat /opt/tomcat/temp/tomcat.pid 2>/dev/null) 2>/dev/null || true
  endscript
}
```

```sh
sudo logrotate -d /etc/logrotate.d/tomcat
```

Restart if change are not applied

```sh
sudo systemctl restart tomcat
```

## Browse Tomcat Server

- Open <http://localhost:8080> or your configured host address from borwser.
- Open <http://localhost:8080/manager> for application manager as `admin` or `manager` user.
- Open <http://localhost:8080/host-manager> for application manager as `admin` user.
- Current password is `tomcat2024` for `admin` and `manager` user.

## Deploy jar/war Application

```sh
sudo cp app.war /opt/tomcat/webapps/
```

To deploy app in context path `/`

```sh
sudo vi /opt/tomcat/conf/server.xml
```

```xml
<Server>
  <Service>
    <Engine>
      <Host>
        <Context path="" docBase="app" debug="0" reloadable="true"></Context>
      </Host>
    </Engine>
  </Service>
</Server>
```

## SSL Certificate

```sh
sudo su
```

```sh
cd /etc/letsencrypt/live/example.com
ln -s cert.pem /opt/tomcat/conf
ln -s chain.pem /opt/tomcat/conf
ln -s privkey.pem /opt/tomcat/conf
```

```sh
sudo vi /opt/tomcat/conf/server.xml
```

Uncomment following segment

```sh
<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
maxThreads="150" SSLEnabled="true">
  <SSLHostConfig>
    <Certificate certificateFile="conf/cert.pem"
                 certificateKeyFile="conf/privkey.pem"
                 certificateChainFile="conf/chain.pem" />
  </SSLHostConfig>
</Connector>
```

```sh
sudo systemctl restart tomcat
```

## Nginx Reverse Proxy

```sh
sudo apt install -y nginx
```

[How to enable port 80 on Apache tomcat?](https://www.digitalocean.com/community/questions/how-to-enable-port-80-on-apache-tomcat)

```sh
sudo tee -a /etc/nginx/sites-available/example.com.conf << EOF
server {
  server_name example.com;
  access_log /var/log/nginx/example.log;
  error_log  /var/log/nginx/example.log error;

  location / {
        rewrite ^/$ /app redirect;
    }

  location /app {
    proxy_connect_timeout       60s;
    proxy_send_timeout          60s;
    proxy_read_timeout          60s;
    proxy_buffer_size           256k;
    proxy_buffers               8 512k;
    proxy_busy_buffers_size     512k;
    proxy_set_header            Host $host;
    proxy_set_header            X-Real-IP $remote_addr;
    proxy_set_header            X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header            X-Forwarded-Proto $scheme;
    proxy_pass                  http://127.0.0.1:8080;
    proxy_redirect              off;
  }
}
EOF
```

```sh
cd /etc/nginx/sites-enabled/
sudo ln -s ../sites-available/example.com.conf ./
```

```sh
sudo systemctl restart nginx
```

## Uninstall Tomcat

Stop service

```sh
sudo systemctl disable --now tomcat
```

Delete tomcat files

```sh
sudo rm -rf /opt/tomcat
```

Remove tomcat package if any

```sh
sudo apt remove -y tomcat
```

Delete tomcat user and group

```sh
sudo userdel tomcat
sudo groupdel tomcat
```

Remove system service file

```sh
sudo rm /etc/systemd/system/tomcat.service
```
