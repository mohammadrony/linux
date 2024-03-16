# Curl

```bash
curl http://localhost/path[1-3]
```

```bash
curl http://localhost/path{1,2,3}
```

```bash
curl http://localhost/path{1,2,3}/subpath[1-3]
```

Using xargs

```bash
seq 5 | xargs -I{} curl http://localhost/path{}
```

Issue 500 requests with 5 always going in parallel

```bash
seq 100 | xargs -P5 -I{} curl http://localhost/path{}
```
