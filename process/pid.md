# PID

## ps commands

Process details

```sh
ps -ef
```

Resource usage with process hierarchy

```sh
ps auxf
```

## Pid to Process

All process full format

```sh
ps -ef | grep <pid>
```

All process specific format

```sh
ps -eo pid,comm | grep <pid>
```

Selected process and format

```sh
ps -o comm -p <pid>
```

```sh
ps -o pid,vsz=MEMORY -o user,group=GROUP -o comm,args=ARGS -p <pid>
```

```sh
ps -o %cpu,%mem,cmd -p <pid>
```

Selected process full format

```sh
ps -f -p <pid>
```

## Pid to Service

```sh
sudo systemctl status <pid>
```

## Process to Pid

Process list

```sh
ps -ef | grep <process>
```

```sh
ps -eo pid,comm | grep <process>
```

Process pid

```sh
pgrep <process>

# 15+ character process name
pgrep -f <process>

# set process id delimiter
pgrep -d',' <process>
```

```sh
pidof <process>
```

Pid by user

```sh
pgrep -u root <process>
```

```sh
pgrep -u root,daemon
```

## Service to Pid

```sh
systemctl status <service> | grep 'Main PID'
```

```sh
systemctl show --property=MainPID <service>
```

## Port to Pid

```sh
sudo fuser <port>/tcp
```

```sh
netstat -nltup | grep :<port>
```

```sh
ss -nltup | grep :<port>
```

## Process Tree

Display process tree

```sh
pstree -p <pid>
```

## Others

```sh
cat /proc/<pid>/status
```
