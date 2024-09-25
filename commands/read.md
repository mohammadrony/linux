# read

## Input from file

Line separate

```bash
IFS=" "
while read i ; do echo $i; done < input.txt
```

Space separate

```bash
IFS=" "
for i in $(cat ./input.txt) ; do echo $i; done
```
