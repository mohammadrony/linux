# Grep

## Text Select

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

## Regex

Print lines doesn't start with #

```bash
grep -v '^#' foo.txt
```

Print line container number starting with 1

```bash
grep '1[0-9]*' foo.txt
```

Print only numbers

```bash
grep -oP '\d+' foo.txt
```

Print files containing text

```bash
grep -n 'text' *.txt
```

## Examples

```bash
grep -Rnw '/path/to/somewhere/' -e 'pattern'
```

```bash
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
```

```bash
grep --exclude=\*.o -rnw '/path/to/search/' -e "pattern"
grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/search/' -e "pattern"
```
