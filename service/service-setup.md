# Service Setup

## List available service

List all services

```bash
sudo systemctl --type=service
```

List running services

```bash
sudo systemctl --type=service --state=running

sudo systemctl --type=service --state=failed

sudo systemctl --type=service --state=active

sudo systemctl --type=service --state=exited
```

## Create new service

```bash
sudo vi /etc/systemd/system/example.service
```

```service
[Unit]
Description=Systemd service example unit file.
After=network.target
Documentation=man:example(1)
Documentation=https://example.com/

[Service]
User=user_name
Group=group_name
WorkingDirectory=/path/
ExecStart=/bin/bash /usr/bin/example
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Start and Enable service

```bash
systemctl daemon-reload
```

```bash
sudo systemctl enable --now example
```

```bash
sudo systemctl enable example
sudo systemctl start example
```

Restart service

```bash
sudo systemctl restart example
```

```bash
sudo systemctl stop example
sudo systemctl start example
```
