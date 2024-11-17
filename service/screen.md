# Screen

Installation

```bash
sudo apt install -y screen
```

New session

```bash
screen
```

```bash
screen -S <name>
```

List available session

```bash
screen -ls
```

Detach screen

`Ctrl` + `a`, `d`

```bash
screen -d
```

```bash
screen -d <name>
```

Reattach to session

```bash
screen -r
```

```bash
screen -r <name>
```

Run command in terminal

```bash
while true; do date; sleep 1; done
```

Terminate session

```bash
screen -X quit
```

```bash
screen -X -S <name> quit
```
