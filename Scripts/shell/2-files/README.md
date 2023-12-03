# File or Directory Size

## Directory size from root

Highest directory size

```bash
sudo du -hcsx -- /* | sort -rh | head
```

Highest directory size including hidden files

```bash
sudo du -hcsx -- .[!.]* /* | sort -rh | head
```
