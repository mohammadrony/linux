# Loop in Bash

## For

Integer number

```sh
for i in {1..100}; do
  echo $i
done
```

```sh
for ((i=1;i<=100;i++)); do
  echo $i
done
```

File list

```sh
for file in *; do
  ls -l $file
done
```

Custom field

```sh
for word in foo bar; do
  echo $word
done
```

Array

```sh
arr=(foo bar)

for word in ${arr[@]}; do
  echo $word
done
```

## While

Infinite loop

```sh
while true; do
  date
  sleep 60
done

Read from file

```sh
while read a b; do
  echo Hello, $a and $b
done < myfile
```

Read from stdin

```sh
while read a b; do
  echo Hello, $a and $b
done < /dev/stdin
foo bar
^D
```
