# Related Issues

## Object file empty

Error message

  error: object file .git/objects/... is empty

Solution 1

```sh
find .git/objects/ -type f -empty -delete
git fetch -p
git fsck --full
```

Solution 2

```sh
git stash
rm .git/objects/...
git status
rm .git/index
```

```sh
git reset
git pull
tail -n 2 .git/logs/refs/heads/BRANCH_NAME
git update-ref HEAD BRANCH_NAME
git status

```sh
git reset
git stash pop
```

## RPC failed; HTTP/2 protocol error

Update http version

```sh
git config --global http.version HTTP/1.1
```

Reset after

```sh
git config --global --unset http.version
```
