# DeepSeek

Prerequisites

- [Ollama](./ollama.md)

## Run

```bash
ollama run deepseek-r1
```

```bash
ollama run deepseek-r1:1.5b
```

## API

Streaming response

```bash
curl -X POST http://127.0.0.1:11434/api/generate -d '{
  "model": "deepseek-r1:7b",
  "prompt": "Hello!",
  "context": []
}'
```

Full response

```bash
curl -X POST http://127.0.0.1:11434/api/generate -d '{
  "model": "deepseek-r1:7b",
  "prompt": "Hello!",
  "context": []
}' | jq -s 'map(.response) | join("")'
```
