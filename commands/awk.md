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

```bash
awk '{print}' foo.txt
```

```bash
awk '/foobar/ {print}' foo.txt 
```

Print first and 4th field

```bash
awk '{print $1,$4}' foo.txt 
```

Print range of line

```bash
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
