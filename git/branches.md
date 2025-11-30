# Branches

## Setup Default Initial Branch

```sh
git config --global init.defaultBranch main
```

## Create and Switch to New Branch

```sh
git branch feature
git checkout feature
```

Or

```sh
git checkout -b feature
```

## List branches

Local branches

```sh
git branch
```

Remote branches

```sh
git branch -r
```

## Rebase changes with Other Branch

Receive updated changes from main branch to feature branch.

```sh
git checkout feature
git rebase main
```

## Merge feature Branch to main Branch

```sh
git checkout feature
git add .
git commit -m "Update feature"
git checkout main
git merge feature
```

## Delete branch

```sh
git branch -d feature
git push origin :feature
```
