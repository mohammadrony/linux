# Commit History of Repository

## See Commit Logs

Full commit history

```sh
git reflog
```

```sh
git log
```

Recent N commits

```sh
git log -N
```

Commit list in one line

```sh
git log --oneline
```

## Reset local repository by commit

```sh
git reset a2c45fg
git reset --soft a2c45fg
git reset --hard a2c45fg
```

## Update current repository with other commit

```sh
git rebase ab3de6g
```

## Remove changes of specific commit

```sh
git revert abc456g
git revert abc456g..HEAD
```
