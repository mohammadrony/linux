# OS Architecture

```bash
dpkg --print-architecture
```

```bash
uname -m
```

```bash
arch
```

```bash
lscpu | awk '/Architecture:/{print $2}'
```

```bash
architecture=""
case $(uname -m) in
    i386 | i686)  architecture="386" ;;
    x86_64)  architecture="amd64" ;;
    arm)  dpkg --print-architecture | grep -q "arm64" && architecture="arm64" || architecture="arm" ;;
    *)  echo "Unable to determine system architecture."; exit 1 ;;
esac

echo $architecture
```
