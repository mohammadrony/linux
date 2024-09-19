# Loop in Bash

## For

Integer number

```bash
for i in {1..100}; do
  echo $i
done
```

```bash
for ((i=1;i<=100;i++)); do
  echo $i
done
```

File list

```bash
for file in *; do
  ls -l $file
done
```

Custom field

```bash
for word in foo bar; do
  echo $word
done
```

Array

```bash
arr=(foo bar)

for word in ${arr[@]}; do
  echo $word
done
```

## While

Infinite loop

```bash
while true; do
  date
  sleep 60
done

Read from file

```bash
while read a b; do
  echo Hello, $a and $b
done < myfile
```

Read from stdin

```bash
while read a b; do
  echo Hello, $a and $b
done < /dev/stdin
foo bar
^D
```
