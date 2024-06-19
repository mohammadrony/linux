# File and Directory Size

## File size

```bash
du *.zip
```

## Directory size

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
