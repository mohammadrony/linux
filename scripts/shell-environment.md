# Shell Environment

## Set Options

Exit immediately if error return

```bash
set -e
```

Treat unset variable as error

```bash
set -u
```

Print command before executing

```bash
set -x
```

Return error if fail in pipe command

```bash
set -o pipefail
```

Using `+` in option will unset this config. i.e. `set +eux`

## Usage

Print command and exit on error

```bash
set -eux
```

Return error and exit including pipe error

```bash
set -euo pipefail
```
