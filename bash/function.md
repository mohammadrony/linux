# Function

Delete word containing line

```bash
del() {
  sed '/'$1'/ID; w v2.txt' v1.txt
```
