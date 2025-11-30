# awk

## Script

```sh
vi script.awk
```

```awk
BEGIN { print "Before processing file" }
{ print NR,$0 }
END { print "After processing file" }
```

```sh
awk -f script.awk foo.txt
# ./script.awk foo.txt
```

## Commands

Print complete file

```sh
awk '{print}' foo.txt
```

Print lines having text

```sh
awk '/text/ {print}' foo.txt
```

Print first and third field

```sh
# Separate by comma (,)
awk '{print $1 "," $3}' foo.txt
```

```sh
# Separate by space
awk '{print $1,$3}' foo.txt
```

Print selected line

```sh
# Print third line
awk 'NR==3 {print NR,$0}' foo.txt
```

```sh
# Print 3rd to 6th line
awk 'NR==3, NR==6 {print NR,$0}' foo.txt
```

Print first and last field

```sh
awk '{print $1,$NF}' foo.txt
```

Find max length line

```sh
awk '{ if (length($0) > max) max = length($0) } END { print max }' foo.txt
```

Insert in empty file

```sh
sudo touch myfile.txt

sudo awk -i inplace 'BEGINFILE {print "foo\tbar\nline\t2"}' myfile.txt
```
