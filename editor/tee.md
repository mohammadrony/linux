# tee

Features

- It save output to the file and prints in the terminal.

Save text to the file

```bash
tee filenme << eof
hello!
eof
```

Append new text

```bash
tee -a filenme << eof
hello world!!
eof
```
