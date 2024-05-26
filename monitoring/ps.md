# Linux Process

List running process

```bash
ps auxf
```

Top memory usage

```bash
ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -5
```
