# Patch

## Create

Current change

```sh
git add .
git diff > <file>
```

Specific commit

```sh
git format-patch -1 <commit>
```

Commit to HEAD change

```sh
git format-patch <commit>
```

Save patch in directory

```sh
git format-patch -1 <commit> -o <path>
```

## Apply

Check

```sh
git apply --check <file>
```

Apply

```sh
git apply <file>
```

```sh
git apply --verbose <file>
```

Apply in reverse

```sh
git apply -R <file>
```
