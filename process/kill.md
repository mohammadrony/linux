# Kill Process

Useful commands:  `fuser`, `kill`, `pkill`, `killall`.

Kill process by port usage

```bash
sudo fuser -k 80/tcp
```

Simulate kill signal

```bash
sudo kill -s 0 <pid>
```

Gracefully shutdown process

```bash
sudo kill <pid>
```

Kill newest process

```bash
sudo pkill -n <process>
```

Kill process by pid forcefully

```bash
sudo kill -9 <pid>
```

Kill process by name forcefully

```bash
sudo pkill -9 <process>
```

Kill process and wait to finish

```bash
sudo pkill -f nginx & wait $!
```

Kill process by name

```bash
sudo killall <process>
```
