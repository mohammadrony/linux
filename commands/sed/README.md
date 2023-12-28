# Sed

## Delete lines by word parameter

```bash
del() {
  sed '/'$1'/ID; w .input-v2.txt' input.txt
}
```
