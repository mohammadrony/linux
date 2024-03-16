# Basics of Git

## Initialize Repository

```bash
git config --global init.defaultBranch main
git init
```

## Set Remote URL

```bash
git remote add origin https://github.com/username/repository.git
git remove set-url origin https://github.com/username/repository.git
```

## Config User for commit

```bash
git config --global user.email "user@example.com"
git config --global user.name "User Name"
```

## Create Commit

### Create new commit

```bash
git add .
git commit -m "Commit message." -m "Commit description."
```

```bash
git commit -a -m "Commit message."
```

## Add Changes to Previous Commit

```bash
git commit --amend --no-edit
```

## Pull Changes from Remote Repository

```bash
git pull origin main
```

## Push new Change to Repository

Publish regular changes.

```bash
git push origin main
```

Override commits in remote repository

```bash
git push -f origin main
```
