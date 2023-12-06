# Find

## Count Line number in Script files

```bash
find ./ -name "*.sh" -exec wc -l {} \; 2>/dev/null | sed 's/ .*//g' | jq -s 'add'
```

## Copy files selectively

```bash
find ./ \( -wholename "*.java" -or -wholename "*.cpp" \) -exec sh -c "ls -l {}; cp --parents {} ~/targetdir/" \;
```

## Remove selective lines from a file

```bash
del() {
sed '/'$1'/ID; w .temp13412341234123.txt' text.txt
mv .temp13412341234123.txt text.txt
}
```
