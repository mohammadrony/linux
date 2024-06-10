# Find

```bash
find ./ -type f -name "*.log"
```

Find files with user and group

```bash
find ./ -user root
find ./ -group root
```

Find files by date

```bash
touch --date "2020-12-31" /tmp/foo
touch --date "2024-02-29 23:59:59" /tmp/foo
```

```bash
find ./ -newer /tmp/foo
```

```bash
find . -anewer /tmp/foo
find . -newermt 2024-06-01
```

Find files with modified time

```bash
find ./ -type f -mmin -7 # minutes
find ./ -type f -mtime -7 # days
```

Update file permission

```bash
find ./ -type l -exec ls -l {} +
find ./ -type f -exec chmod 644 {} +
find ./ -type d -exec chmod 755 {} +
find ./ -exec chown apache:apache {} +
```

Count number of lines from similar files

```bash
find ./ -name "*.sh" -exec wc -l {} \; 2>/dev/null | sed 's/ .*//g' | jq -s 'add'
```

Copy files selectively

```bash
find ./ \( -wholename "*.java" -or -wholename "*.cpp" \) -exec sh -c "ls -l {}; cp --parents {} ~/targetdir/" \;
```

Find files with same reference

```bash
find -L /bin -samefile /bin/sh
```
