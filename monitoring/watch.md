# Watch

Monitor command

```bash
watch command
```

Monitor `command` with 5s interval and write in file

```bash
watch -t -n 5 "(date '+TIME:%H:%M:%S' ; command) | tee -a logfile"
```
