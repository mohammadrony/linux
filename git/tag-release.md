# Tag and Release

## Get Tag

```bash
git tag
```

## Create Tag

Create a new tag

```bash
git tag <tagname>
```

Push a specific tag

```bash
git push origin <tagname>
```

Push all tags

```bash
git push --tags
```

## Delete Tag

Delete a local tag

```bash
git tag -d <tagname>
```

Delete a remote tag

```bash
git push origin --delete <tagname>
```

## Create Release

- Create a tag and push it to repository.
- Open the repository > Releases > Draft a new release.
- Enter tag details > Publish release.
