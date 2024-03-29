# Redirect

## Redirect output to another address

- `command 2>/dev/null`
  - redirects stderr to /dev/null.
- `command 1>/dev/null`
  - redirects stdout to /dev/null.
- `command 2>/dev/null 1>&2`
  - redirects stderr to /dev/null then
  - redirects stdout to stderr address.

## Write output into multiple file

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
