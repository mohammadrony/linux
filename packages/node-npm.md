# Nodejs and NPM

## TL;DR

```sh
version=v0.39.7
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh | bash
source ~/.bashrc
```

```sh
nvm install 20.0
```

## NVM Install

### Install nvm

Latest version of [NVM](https://github.com/nvm-sh/nvm)

```sh
version=v0.39.7
curl -O https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh

bash install.sh
rm -f install.sh
```

```sh
vi ~/.bashrc
```

```shrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

```sh
source .bashrc
```

Check version

```sh
nvm --version
```

### Install node using nvm

List available versions

```sh
nvm ls
```

```sh
nvm ls-remote
```

Install Node and NPM

```sh
nvm install node
```

```sh
nvm install stable
```

```sh
nvm install --lts
```

```sh
nvm install 20.0
```

Use specific version

```sh
nvm alias default 20.0
```

```sh
nvm use default
```

```sh
nvm use --lts
```

```sh
nvm use 20.0
```

```sh
nvm use node
```

### Uninstall node

Uninstall Node

```sh
nvm uninstall <version>
```

Uninstall nvm

```sh
rm -rf .nvm
```

Remove nvm entry from login file

```sh
vi .bashrc
```

## Package Install

### NodeSource install

```sh
version=lts # 20 18
curl -fsSL "https://deb.nodesource.com/setup_${version}.x" -o nodesource_setup.sh
```

```sh
sudo bash nodesource_setup.sh
```

Install nodejs

```sh
sudo apt install -y nodejs
```

Hold apt package

```sh
sudo apt-mark hold nodejs npm
```

### Uninstall nodejs

```sh
sudo apt remove -y nodejs
```
