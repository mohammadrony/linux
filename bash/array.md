# Array

## Indexed array

Declare an array

```sh
arr1=("foo" "bar" "baz")
```

Access items

```sh
echo ${arr1[0]}
echo ${arr1[-1]}
```

Get array length

```sh
echo ${#arr1[@]}
```

Index items

```sh
for i in "${arr1[@]}"; do
    echo $i
done
```
