# Kill Process

Useful commands:  `fuser`, `kill`, `pkill`, `killall`.

Kill process by port usage

```sh
sudo fuser -k 80/tcp
```

Simulate kill signal

```sh
sudo kill -s 0 <pid>
```

Gracefully shutdown process

```sh
sudo kill <pid>
```

Kill newest process

```sh
sudo pkill -n <process>
```

Kill process by pid forcefully

```sh
sudo kill -9 <pid>
```

Kill process by name forcefully

```sh
sudo pkill -9 <process>
```

Kill process and wait to finish

```sh
sudo pkill -f nginx & wait $!
```

Kill process by name

```sh
sudo killall <process>
```
