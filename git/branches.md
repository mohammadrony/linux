# Branches

## Setup Default Initial Branch

```bash
git config --global init.defaultBranch main
```

## Create and Switch to New Branch

```bash
git branch feature
git checkout feature
```

Or

```bash
git checkout -b feature
```

## List branches

Local branches

```bash
git branch
```

Remote branches

```bash
git branch -r
```

## Rebase changes with Other Branch

Receive updated changes from main branch to feature branch.

```bash
git checkout feature
git rebase main
```

## Merge feature Branch to main Branch

```bash
git checkout feature
git add .
git commit -m "Update feature"
git checkout main
git merge feature
```

## Delete branch

```bash
git branch -d feature
git push origin :feature
```
