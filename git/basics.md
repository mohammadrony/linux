# Basics of Git

## Initialize Repository

```sh
git config --global init.defaultBranch main
git init
```

## Set Remote URL

```sh
git remote add origin https://github.com/username/repository.git
git remove set-url origin https://github.com/username/repository.git
```

## Config User for commit

```sh
git config --global user.email "user@example.com"
git config --global user.name "User Name"
```

## Create Commit

### Create new commit

```sh
git add .
git commit -m "Commit message." -m "Commit description."
```

```sh
git commit -a -m "Commit message."
```

## Add Changes to Previous Commit

```sh
git commit --amend --no-edit
```

## Pull Changes from Remote Repository

```sh
git pull origin main
```

## Push new Change to Repository

Publish regular changes.

```sh
git push origin main
```

Override commits in remote repository

```sh
git push -f origin main
```
