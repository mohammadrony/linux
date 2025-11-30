# top

```sh
top
```

```sh
top -p <pid>
# top -p $(pgrep -d',' <process>)
```

## Keyboard shortcut

Sort and Field Select

- `f` `%MEM` `s` `q` : Soft by memory
- `f` `%CPU` `s` `q` : Soft by CPU
- `<` : Sort by left field
- `>` : Sort by right field
- `f` `FIELD` `<Space>` `q`: Toggle FIELD view

Change View

- `t` : Toggle task/cpu view
- `V` : Toggle forest view
- `v` : Toggle forest children view
- `c` : Toggle command name

Find process

- `L` `TEXT` : Search TEXT
- `L` `TEXT` `&` : Search TEXT and again

Update task

- `k` `PID` : Kill process by PID
