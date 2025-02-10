# Ollama

Installation

```bash
curl -LO https://ollama.com/install.sh

sh install.sh
rm -f install.sh
```

## Server

```bash
ollama serve
```

Allow public access

```bash
sudo vi /etc/systemd/system/ollama.service
```

```txt
[Service]
...
...
...

Environment="OLLAMA_HOST=0.0.0.0"'
```

```bash
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

Check status

```bash
sudo systemctl status ollama
```

```bash
sudo netstat -nltp
```

List models

```bahs
ollama list
```

## Model

Run model

```bash
ollama run MODEL
```

Stop model

```bash
ollama stop MODEL
```

Remove model

```bash
ollama rm MODEL
```
