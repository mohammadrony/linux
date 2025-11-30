# pidstat

```sh
pidstat
```

```sh
pidstat -p ALL
```

Start program and monitor

```sh
pidstat -e <program> <args>
```

Task threads status

```sh
pidstat -t
```

Process status

```sh
pidstat -p <pid>
```

```sh
pidstat -C <command>
```

Display multiple report

```sh
pidstat -p <pid> <interval> <count>
```

Monitor command process and its threads

```sh
pidstat -t -C <command> <interval> <count>
```
