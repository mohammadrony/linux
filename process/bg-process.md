# Background Process

Run script in background

```bash
(
  script
) &
```

List running jobs

```bash
jobs
```

```bash
jobs -l
```

Restart a stopped background process

```bash
# bg %n
bg %1
```

Bring process to frontend

```bash
# fg %n
fg %1
```

Find process details

```bash
ps -o pid,vsz=MEMORY -o user,group=GROUP -o comm,args=ARGS -p <pid>
```

Kill running jobs

```bash
# kill %n
kill %1
```
