# OS Architecture

```sh
dpkg --print-architecture
```

```sh
uname -m
```

```sh
arch
```

```sh
lscpu | awk '/Architecture:/{print $2}'
```

```sh
architecture=""
case $(uname -m) in
    i386 | i686)  architecture="386" ;;
    x86_64)  architecture="amd64" ;;
    arm)  dpkg --print-architecture | grep -q "arm64" && architecture="arm64" || architecture="arm" ;;
    *)  echo "Unable to determine system architecture."; exit 1 ;;
esac

echo $architecture
```
