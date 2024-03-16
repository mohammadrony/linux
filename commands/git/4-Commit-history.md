# Commit History of Repository

## See Commit Logs

Full commit history

```bash
git reflog
```

```bash
git log
```

Recent N commits

```bash
git log -N
```

Commit list in one line

```bash
git log --oneline
```

## Reset local repository by commit

```bash
git reset a2c45fg
git reset --soft a2c45fg
git reset --hard a2c45fg
```

## Update current repository with other commit

```bash
git rebase ab3de6g
```

## Remove changes of specific commit

```bash
git revert abc456g
git revert abc456g..HEAD
```
