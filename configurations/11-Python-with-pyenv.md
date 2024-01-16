# Python setup with pyenv

## Packages Installation

### Install pyenv

```bash
sudo apt-get install -y git
sudo apt-get install -y build-essential libbz2-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev tk-dev

# Optional scientific package headers (for Numpy, Matplotlib, SciPy, etc.)
sudo apt-get install -y libpng-dev libfreetype6-dev 
```

```bash
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

```bash
vi ~/.bashrc
```

```bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

```bash
exec $SHELL
source ~/.bashrc
```

### Install Python with APT

```bash
sudo apt install -y python3 python3-pip python3-venv python-is-python3
```

### Install Python with Pyenv

```bash
pyenv install 3.6.0
```

```bash
pyenv virtualenv 3.6.0 general
```

```bash
pyenv global general
```

Uninstall

```bash
pyenv uninstall general
```

Other usage

```bash
pyenv virtualenv 3.6.0 project_1
```

```bash
pyenv local project_1
```

## Setup virtual environment

```bash
python -m venv <venv-project-1>
source <venv-project-1>/bin/activate
```

## Install required packages for application

```bash
pip install -r requirements.txt
pip install <module>
```

## Run a python code

```bash
python main.py
```

## Deactivate virtual env

```bash
deactivate
```
