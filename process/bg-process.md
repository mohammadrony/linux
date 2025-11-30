# Background Process

Run script in background

```sh
(
  script
) &
```

List running jobs

```sh
jobs
```

```sh
jobs -l
```

Restart a stopped background process

```sh
# bg %n
bg %1
```

Bring process to frontend

```sh
# fg %n
fg %1
```

Find process details

```sh
ps -o pid,vsz=MEMORY -o user,group=GROUP -o comm,args=ARGS -p <pid>
```

Kill running jobs

```sh
# kill %n
kill %1
```
