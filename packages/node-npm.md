# Nodejs and NPM

## TL;DR

```sh
version=$(curl https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r .tag_name)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh | bash
source ~/.bashrc
```

```sh
nvm install node
nvm install 24
```

## NVM Install

### Install nvm

Latest version of [NVM](https://github.com/nvm-sh/nvm)

```sh
version=$(curl https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r .tag_name)
curl -O https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh

bash install.sh
rm -f install.sh
```

```sh
vi ~/.bashrc
```

```sh
for FILE in ~/.bashrc ~/.zshrc; do
tee -a "$FILE" << 'EOF'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOF
done
```

```sh
case "$SHELL" in
  */zsh) source ~/.zshrc ;;
  */bash) source ~/.bashrc ;;
esac
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
nvm install 26
```

Use specific version

```sh
nvm alias default 26
```

```sh
nvm use default
```

```sh
nvm use --lts
```

```sh
nvm use 26
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
version=lts # 26 24
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
