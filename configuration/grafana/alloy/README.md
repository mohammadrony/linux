# Alloy

## Installation

```sh
wget -qO- https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
```

```sh
sudo apt update
sudo apt install -y alloy
```

## Configuration

Expose http server

```sh
sed -i -e 's/CUSTOM_ARGS=""/CUSTOM_ARGS="--server.http.listen-addr=0.0.0.0:12345"/' /etc/default/alloy
```

Start service

```sh
sudo systemctl enable --now alloy
sudo systemctl status alloy
```

Update config for metrics and logs

```sh
sudo cp config.alloy /etc/alloy/config.alloy
```

Reload config

```sh
curl -X POST http://localhost:12345/-/reload
# sudo systemctl reload alloy
```

Browse [alloy ui](http://localhost:12345).

## Troubleshoot

Logs

```sh
sudo journalctl -u alloy
```
