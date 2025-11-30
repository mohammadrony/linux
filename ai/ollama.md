# Ollama

Installation

```sh
curl -LO https://ollama.com/install.sh

sh install.sh
rm -f install.sh
```

## Server

```sh
ollama serve
```

Allow public access

```sh
sudo vi /etc/systemd/system/ollama.service
```

```txt
[Service]
...
...
...

Environment="OLLAMA_HOST=0.0.0.0"'
```

```sh
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

Check status

```sh
sudo systemctl status ollama
```

```sh
sudo netstat -nltp
```

List models

```bahs
ollama list
```

## Model

Run model

```sh
ollama run MODEL
```

Stop model

```sh
ollama stop MODEL
```

Remove model

```sh
ollama rm MODEL
```
