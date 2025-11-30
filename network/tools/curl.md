# curl

## Common usage

Internet facing ip address (public)

```sh
curl ifconfig.me
```

## Options

Quite mode

```sh
curl -s www.example.com
```

Save in specific name

```sh
curl -o filename www.example.com
```

Save in remote name

```sh
curl -O www.example.com
```

Visit redirected url

```sh
curl -L www.example.com
```

Get response code

```sh
curl -I www.example.com
```

## Multiple request

```sh
curl http://localhost/path[1-3]
```

```sh
curl http://localhost/path{1,2,3}
```

```sh
curl http://localhost/path{1,2,3}/subpath[1-3]
```

Using xargs

```sh
seq 5 | xargs -I{} curl http://localhost/path{}
```

Issue 500 requests with 5 always going in parallel

```sh
seq 100 | xargs -P5 -I{} curl http://localhost/path{}
```
