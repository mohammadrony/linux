# Process Status

`ps` options

- `f`: tree format

List running process

```bash
ps auxf
```

```bash
ps -ef
ps -ef | grep foo
```

Output specific format

```bash
ps -eo pid,user,group,args,etime,lstart
```

Process environment variable

```bash
sudo cat /proc/PID/environ
sudo grep --color -w -a USER /proc/PID/environ
```

*Update `PID` with real value.*
