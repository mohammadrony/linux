# Screen

Installation

```sh
sudo apt install -y screen
```

New session

```sh
screen
```

```sh
screen -S <name>
```

List available session

```sh
screen -ls
```

Detach screen

`Ctrl` + `a`, `d`

```sh
screen -d
```

```sh
screen -d <name>
```

Reattach to session

```sh
screen -r
```

```sh
screen -r <name>
```

Run command in terminal

```sh
while true; do date; sleep 1; done
```

Terminate session

```sh
screen -X quit
```

```sh
screen -X -S <name> quit
```
