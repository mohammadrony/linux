# Find

## Count number of lines from similar files

```bash
find ./ -name "*.sh" -exec wc -l {} \; 2>/dev/null | sed 's/ .*//g' | jq -s 'add'
```

## Copy files selectively

```bash
find ./ \( -wholename "*.java" -or -wholename "*.cpp" \) -exec sh -c "ls -l {}; cp --parents {} ~/targetdir/" \;
```

## Find files with same reference

```bash
find -L /bin -samefile /bin/sh
```
