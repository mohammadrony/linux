# Load Testing

```bash
ab -n 500 -c 50 "https://example.com/"
```

```bash
ab -n 10000 -c 1000 -k "https://example.com/"
```

```bash
ab -n 1000 -c 50 -k -g output.txt "https://example.com/"
```
