# Process Details

`ps` options

- `f`: tree format

## List running process

```bash
ps auxf
```

```bash
ps -ef
ps -ef | grep foo
```

## Pid to process

```bash
ps -p <pid> -o comm=
```

```bash
ps -p <pid> -o pid,vsz=MEMORY -o user,group=GROUP -o comm,args=ARGS
```

```bash
ps -p <pid> -o %cpu,%mem,cmd
```

## Process by command

```bash
ps -C <command> -o %cpu,%mem,cmd
```

## Print selected field

```bash
ps -eo pid,user,group,args,etime,lstart
```

## Related process and files

Display process tree

```bash
pstree -p <pid>
```

List open files

```bash
lsof -p <pid>
```

More info

```bash
cat /proc/<pid>/status
```
