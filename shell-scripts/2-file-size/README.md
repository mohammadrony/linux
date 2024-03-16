# File or Directory Size

## Directory size from root

Exclude specific directory

```bash
sudo du -sh ./* --exclude /home
```

```bash
sudo du -hcsx -- /* | sort -rh
```

Highest directory size including hidden files

```bash
sudo du -hcsx -- .[!.]* /* | sort -rh
```
