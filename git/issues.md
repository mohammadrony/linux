# Related Issues

## Object file empty

Error message

  error: object file .git/objects/... is empty

Solution 1

```bash
find .git/objects/ -type f -empty -delete
git fetch -p
git fsck --full
```

Solution 2

```bash
git stash
rm .git/objects/...
git status
rm .git/index
```

```bash
git reset
git pull
tail -n 2 .git/logs/refs/heads/BRANCH_NAME
git update-ref HEAD BRANCH_NAME
git status

```bash
git reset
git stash pop
```
