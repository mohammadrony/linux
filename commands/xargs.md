# Xargs

## Commands

```sh
seq 5 | xargs -I{} curl http://localhost/path{}
```

Issue 500 requests with 5 always going in parallel

```sh
seq 100 | xargs -P5 -I{} curl http://localhost/path{}
```

*If max-procs is 0, xargs will run as many processes as possible at a time.*
