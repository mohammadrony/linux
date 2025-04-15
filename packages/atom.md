# Atom Editor

## Installation

```bash
version=$(curl https://api.github.com/repos/atom/atom/releases/latest | jq -r .tag_name)
curl -LO https://github.com/atom/atom/releases/download/$version/atom-amd64.deb
```

```bash
sudo apt install ./atom-amd64.deb
```

```bash
rm atom-amd64.deb
```
