# PIDs

## Port to pid

```bash
sudo fuser 80/tcp
```

```bash
netstat -nltup | grep :80
```

```bash
ss -nltup | grep :80
```

## Process to pid

By process name

```bash
pidof <process>
```

```bash
pgrep <process>
```

```bash
pgrep -d',' <process>
```

By process owner

```bash
pgrep -u root,daemon
```
