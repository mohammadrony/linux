# Open Files

## Filesystem

File

```sh
lsof <file>
```

Directory

```sh
lsof +d <directory>
```

Recursive directory

```sh
lsof +D <directory>
```

Command

```sh
lsof -c <command>
```

User

```sh
lsof -u <user>
```

PID

```sh
lsof -p <pid>
```

Multiple argument

```sh
lsof -d <directory> -a -c <command>
```

## Network

Internet protocol

```sh
lsof -i 4
```

```sh
lsof -i 6
```

Port connection

```sh
lsof -Pi :<port>
```

Network address

```sh
lsof -Pni :<port>
```

IP address connection

```sh
lsof -Pni @127.0.0.1
```

Multiple argument

```sh
lsof -c <command> -a -Pni
```
