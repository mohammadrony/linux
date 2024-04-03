# Grep

```bash
grep 'bar' foo.txt
echo 'bar baz' | grep 'bar'
```

Ignore case

```bash
echo 'bar baz' | grep -i 'bar'
```

Print matched text only

```bash
echo 'bar baz' | grep -o 'bar'
```

Print lines doesn't start with #

```bash
grep -v '^#' foo.txt
```

Print only numbers

```bash
grep -oP '\d+' foo.txt
```
