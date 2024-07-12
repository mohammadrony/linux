# Kill Process

Useful commands:  `fuser`, `kill`, `pkill`, `killall`.

Kill process by port usage

```bash
sudo fuser -k 80/tcp
```

Kill process by pid

```bash
sudo kill -9 <pid>
```

Kill process by name

```bash
sudo pkill -9 <process>
```

Kill newest process

```bash
sudo pkill -n <process>
```

Kill process and wait to finish

```bash
sudo pkill -f nginx & wait $!
```

Kill process by name

```bash
sudo killall <process>
```
