# Node setup with nvm

## Packages Installation

### Install nvm

Latest version of [NVM](https://github.com/nvm-sh/nvm)

```bash
version=v0.39.7
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh | bash
```

```bash
vi .bashrc
```

```bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

```bash
source .bashrc
```

Check version

```bash
nvm --version
```

### Install Node using nvm

```bash
nvm install node
```

```bash
nvm install stable
```

```bash
nvm install --lts
```

```bash
nvm install 20.0
```

List available versions

```bash
nvm ls
```

```bash
nvm ls-remote
```

Use specific version

```bash
nvm alias default 20.0
```

```bash
nvm use default
```

```bash
nvm use --lts
```

```bash
nvm use 20.0
```

```bash
nvm use node
```

## Uninstall Package

Uninstall Node

```bash
nvm uninstall <version>
```

Uninstall nvm

```bash
rm -rf .nvm
```

Remove nvm entry from login file

```bash
vi .bashrc
```
