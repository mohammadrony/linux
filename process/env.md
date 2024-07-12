# Process Environment

## Process Working Directory

```bash
ps -ef | grep <process>
ps aux | grep <process>
```

```bash
pwdx <pid>
```

```bash
ls -l /proc/<pid>/cwd
```

## Environment Variable

```bash
sudo cat /proc/<pid>/environ
sudo grep --color -w -a USER /proc/<pid>/environ
```
