# Open Files

## Filesystem

File

```bash
lsof <file>
```

Directory

```bash
lsof +d <directory>
```

Recursive directory

```bash
lsof +D <directory>
```

Command

```bash
lsof -c <command>
```

User

```bash
lsof -u <user>
```

PID

```bash
lsof -p <pid>
```

Multiple argument

```bash
lsof -d <directory> -a -c <command>
```

## Network

Internet protocol

```bash
lsof -i 4
```

```bash
lsof -i 6
```

Port connection

```bash
lsof -Pi :<port>
```

Network address

```bash
lsof -Pni :<port>
```

IP address connection

```bash
lsof -Pni @127.0.0.1
```

Multiple argument

```bash
lsof -c <command> -a -Pni
```
