# Process Environment

## Process Working Directory

```sh
ps -ef | grep <process>
ps aux | grep <process>
```

```sh
pwdx <pid>
```

```sh
ls -l /proc/<pid>/cwd
```

## Environment Variable

```sh
sudo cat /proc/<pid>/environ
sudo grep --color -w -a USER /proc/<pid>/environ
```
