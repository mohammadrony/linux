# Patch

## Create

Current change

```bash
git add .
git diff > <file>
```

Specific commit

```bash
git format-patch -1 <commit>
```

Commit to HEAD change

```bash
git format-patch <commit>
```

Save patch in directory

```bash
git format-patch -1 <commit> -o <path>
```

## Apply

Check

```bash
git apply --check <file>
```

Apply

```bash
git apply <file>
```

```bash
git apply --verbose <file>
```

Apply in reverse

```bash
git apply -R <file>
```
