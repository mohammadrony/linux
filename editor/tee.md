# tee

## Commands

Save text to new file

```bash
tee file.txt << eof
hello!
eof
```

Append new text

```bash
tee -a file.txt << eof
hello world!!
eof
```

Watch command output and save in file

```bash
while true; do date; sleep 1; done |& tee -a file.txt
```

```bash
watch '(date; sleep 1) | tee -a file.txt'
```

Related question

- [How do I save terminal output to a file?](https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file)
