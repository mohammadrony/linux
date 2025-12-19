# Locale

Search language pack

```sh
apt search language-pack-en
```

Install locale packages

```sh
sudo apt install -y locales language-pack-en language-pack-en-base
```

Set locale

```sh
sudo localectl set-locale LANG=en_US.UTF-8 
```

Display settings

```sh
localectl
```
