# File and Directory Size

## File size

```sh
du *.zip
```

## Directory size

Exclude specific directory

```sh
sudo du -sh ./* --exclude /home
```

```sh
sudo du -hcsx -- /* | sort -rh
```

Highest directory size including hidden files

```sh
sudo du -hcsx -- .[!.]* /* | sort -rh
```

## dutop

```sh
curl -O -L http://www.pixelbeat.org/scripts/dutop
```

```sh
python dutop
```
