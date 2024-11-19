# jq

```bash
sudo snap install jq
```

## Commands

Print json path

```bash
cat file.json | jq -c 'paths|join(".")'
```
