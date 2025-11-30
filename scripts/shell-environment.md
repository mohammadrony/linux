# Shell Environment

## Set Options

Exit immediately if error return

```sh
set -e
```

Treat unset variable as error

```sh
set -u
```

Print command before executing

```sh
set -x
```

Return error if fail in pipe command

```sh
set -o pipefail
```

Using `+` in option will unset this config. i.e. `set +eux`

## Usage

Print command and exit on error

```sh
set -eux
```

Return error and exit including pipe error

```sh
set -euo pipefail
```
