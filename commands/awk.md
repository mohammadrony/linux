# Awk

## Script

```bash
vi script.awk
```

```awk
BEGIN { print "Before processing file" }
{ print NR,$0 }
END { print "After processing file" }
```

```bash
awk -f script.awk foo.txt
# ./script.awk foo.txt
```

## Commands

Print complete file

```bash
awk '{print}' foo.txt
```

Print lines having text

```bash
awk '/text/ {print}' foo.txt
```

Print first and third field

```bash
# Separate by comma (,)
awk '{print $1 "," $3}' foo.txt
```

```bash
# Separate by space
awk '{print $1,$3}' foo.txt
```

Print selected line

```bash
# Print third line
awk 'NR==3 {print NR,$0}' foo.txt
```

```bash
# Print 3rd to 6th line
awk 'NR==3, NR==6 {print NR,$0}' foo.txt
```

Print first and last field

```bash
awk '{print $1,$NF}' foo.txt
```

Find max length line

```bash
awk '{ if (length($0) > max) max = length($0) } END { print max }' foo.txt
```

Insert in empty file

```bash
sudo touch myfile.txt

sudo awk -i inplace 'BEGINFILE {print "foo\tbar\nline\t2"}' myfile.txt
```
