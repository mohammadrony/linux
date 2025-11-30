# grep

## Text Select

```sh
grep 'foo' file.txt
cat file.txt | grep 'bar'
```

Print matched text only

```sh
echo 'bar baz' | grep -o 'bar'
```

Ignore case of matched text

```sh
cat file.txt | grep -i 'foo'
```

Print previous few lines of matched line

```sh
cat file.txt | grep -B 3 'foo'
```

Print next few lines of matched line

```sh
cat file.txt | grep -A 3 'foo'
```

## Regex

Print lines doesn't start with #

```sh
grep -v '^#' foo.txt
```

Print line container number starting with 1

```sh
grep '1[0-9]*' foo.txt
```

Print only numbers

```sh
grep -oP '\d+' foo.txt
```

Print files containing text

```sh
grep -n 'text' *.txt
```

## Examples

```sh
grep -Rnw '/path/to/somewhere/' -e 'pattern'
```

```sh
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
```

```sh
grep --exclude=\*.o -rnw '/path/to/search/' -e "pattern"
grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/search/' -e "pattern"
```
