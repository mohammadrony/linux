# Nodejs and NPM setup with NVM

## TL;DR

```bash
version=v0.39.7
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh | bash
source ~/.bashrc
```

```bash
nvm install 20.0
```

## NVM Install

### Install nvm

Latest version of [NVM](https://github.com/nvm-sh/nvm)

```bash
version=v0.39.7
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh | bash
```

```bash
vi ~/.bashrc
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

### Install node using nvm

List available versions

```bash
nvm ls
```

```bash
nvm ls-remote
```

Install Node and NPM

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

### Uninstall node

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

## Package Install

### NodeSource install

```bash
version=lts # 20 18
curl -fsSL "https://deb.nodesource.com/setup_${version}.x" -o nodesource_setup.sh
```

```bash
bash nodesource_setup.sh
```

Install nodejs

```bash
sudo apt install -y nodejs
```

Hold apt package

```bash
sudo apt-mark hold nodejs npm
```

### Uninstall nodejs

```bash
sudo apt remove -y nodejs
```
