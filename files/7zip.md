# 7zip

Installation

```sh
sudo apt install -y 7zip
```

## Commands

### Create

Create archive

```sh
7z a archive.7z file1.txt file2.txt file3.txt
```

Add files in archive

```sh
7z u archive.7z file4.txt file5.txt
```

Create archive excluding specific files

```sh
7z a archive.7z * -x!*.log -x!temp/
```

### List

List contents of archive

```sh
7z l archive.7z
```

### Extract

Extract archive

```sh
7z x archive.7z
```

Extract in specific directory

```sh
7z x archive.7z -o /path/to/directory
```

Extract specific file

```sh
7z x archive.7z -o /path/to/directory file1.txt
```

Extract with progress details

```sh
7z x -bsp1 archive.7z
```

Extract archive excluding specific files

```sh
7z x archive.7z -x!*.log -x!temp/
```
