# Generate Password in Bash

## Prompt password

Bash

```sh
passgen() {
  read -rs -p 'Encryption key: ' key
  echo '' # line break
  echo -n "$key:$1" | sha256sum | perl -ne "s/([0-9a-f]{2})/print chr hex \$1/gie" | base64 | tr +/ Ea | cut -b 1-20
}
```

Zsh

```zsh
passgen() {
  read -rs key\?'Encryption key: '
  echo '' # line break
  echo -n "$key:$1" | sha256sum | perl -ne "s/([0-9a-f]{2})/print chr hex \$1/gie" | base64 | tr +/ Ea | cut -b 1-20
}
```

## Copy password to Clipboard

Bash

```sh
passgen () {
  read -rs -p 'Encryption key: ' key
  echo '' # line break
  echo -n "$key:$1" | sha256sum | perl -ne "s/([0-9a-f]{2})/print chr hex \$1/gie" | base64 | tr +/ Ea | cut -b 1-20 | read key; printf "%s" ${key} | xclip -i -selection clipboard
  echo 'Copied to clipboard'
}
```

Zsh

```zsh
passgen () {
  read -rs key\?'Encryption key: '
  echo '' # line break
  echo -n "$key:$1" | sha256sum | perl -ne "s/([0-9a-f]{2})/print chr hex \$1/gie" | base64 | tr +/ Ea | cut -b 1-20 | read key; printf "%s" ${key} | xclip -i -selection clipboard
  echo 'Copied to clipboard'
}
```
