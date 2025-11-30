# read

## Input from file

Line separate

```sh
IFS=" "
while read i ; do echo $i; done < input.txt
```

Space separate

```sh
IFS=" "
for i in $(cat ./input.txt) ; do echo $i; done
```
