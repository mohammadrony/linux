# Array

## Indexed array

Declare an array

```bash
arr1=("foo" "bar" "baz")
```

Access items

```bash
echo ${arr1[0]}
echo ${arr1[-1]}
```

Get array length

```bash
echo ${#arr1[@]}
```

Index items

```bash
for i in "${arr1[@]}"; do
    echo $i
done
```
