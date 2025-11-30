# watch

Monitor command

```sh
watch command
```

Monitor `command` with 5s interval and write in file

```sh
watch -t -n 5 "(date '+TIME:%H:%M:%S' ; command) | tee -a logfile"
```
