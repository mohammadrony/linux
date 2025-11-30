# Atom Editor

## Installation

```sh
version=$(curl https://api.github.com/repos/atom/atom/releases/latest | jq -r .tag_name)
curl -LO https://github.com/atom/atom/releases/download/$version/atom-amd64.deb
```

```sh
sudo apt install ./atom-amd64.deb
```

```sh
rm atom-amd64.deb
```
