# Alloy

## Installation

```bash
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
```

```bash
sudo apt update
sudo apt install -y alloy
```

## Configuration

Expose http server

```bash
sed -i -e 's/CUSTOM_ARGS=""/CUSTOM_ARGS="--server.http.listen-addr=0.0.0.0:12345"/' /etc/default/alloy
```

Start service

```bash
sudo systemctl enable --now alloy
```

```bash
sudo systemctl status alloy
```

Browse [alloy ui](http://localhost:12345).

## Troubleshoot

Logs

```bash
sudo journalctl -u alloy
```
