# Function

Delete word containing line

```sh
del() {
  sed '/'$1'/ID; w v2.txt' v1.txt
```
