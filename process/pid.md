# PID

## ps commands

Process details

```bash
ps -ef
```

Resource usage with process hierarchy

```bash
ps auxf
```

## Pid to Process

All process full format

```bash
ps -ef | grep <pid>
```

All process specific format

```bash
ps -eo pid,comm | grep <pid>
```

Selected process and format

```bash
ps -o comm -p <pid>
```

```bash
ps -o pid,vsz=MEMORY -o user,group=GROUP -o comm,args=ARGS -p <pid>
```

```bash
ps -o %cpu,%mem,cmd -p <pid>
```

Selected process full format

```bash
ps -f -p <pid>
```

## Pid to Service

```bash
sudo systemctl status <pid>
```

## Process to Pid

Process list

```bash
ps -ef | grep <process>
```

```bash
ps -eo pid,comm | grep <process>
```

Process pid

```bash
pgrep <process>

# 15+ character process name
pgrep -f <process>

# set process id delimiter
pgrep -d',' <process>
```

```bash
pidof <process>
```

Pid by user

```bash
pgrep -u root <process>
```

```bash
pgrep -u root,daemon
```

## Service to Pid

```bash
systemctl status <service> | grep 'Main PID'
```

```bash
systemctl show --property=MainPID <service>
```

## Port to Pid

```bash
sudo fuser <port>/tcp
```

```bash
netstat -nltup | grep :<port>
```

```bash
ss -nltup | grep :<port>
```

## Process Tree

Display process tree

```bash
pstree -p <pid>
```

## Open files

```bash
lsof -p <pid>
```

## Others

```bash
cat /proc/<pid>/status
```
