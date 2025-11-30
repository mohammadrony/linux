# Tag and Release

## Get Tag

```sh
git tag
```

## Create Tag

Create a new tag

```sh
git tag <tagname>
```

Push a specific tag

```sh
git push origin <tagname>
```

Push all tags

```sh
git push --tags
```

## Delete Tag

Delete a local tag

```sh
git tag -d <tagname>
```

Delete a remote tag

```sh
git push origin --delete <tagname>
```

## Create Release

- Create a tag and push it to repository.
- Open the repository > Releases > Draft a new release.
- Enter tag details > Publish release.
