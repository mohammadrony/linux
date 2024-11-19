# Redirect

[Redirection](https://www.gnu.org/software/bash/manual/bash.html#Redirections)

## Commands

Save output in multiple file

```bash
echo "1st line"
echo "2nd line" >&2
echo "3rd line" >&3
echo "4th line"
echo "5th line" >&2
echo "6th line" >&3
```

```bash
source script.sh >file1.txt 2>file2.txt 3>file3.txt
```

Redirects stdout to /dev/null

```bash
command >/dev/null | grep 'something'
```

```bash
command 1>/dev/null | grep 'something'
```

Redirects stderr to /dev/null

```bash
command 2>/dev/null | grep 'something'
```

Redirects stderr to /dev/null then redirects stdout to stderr address

```bash
command 2>/dev/null 1>&2
```

```bash
command &>/dev/null
```

Redirect stderr to stdout then redirect stdout to /dev/null

```bash
command 2>&1 >/dev/null | grep 'something'
```

*[Details here.](https://stackoverflow.com/questions/2342826/how-can-i-pipe-stderr-and-not-stdout)*
