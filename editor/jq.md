# jq

```sh
sudo snap install jq
```

## Commands

Print json path

```sh
cat file.json | jq -c 'paths|join(".")'
```
