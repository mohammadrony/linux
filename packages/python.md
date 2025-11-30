# Python

## UV

```sh
curl -LO https://astral.sh/uv/install.sh

bash install.sh
rm -f install.sh
```

Commands

```sh
uv
```

Create virtual environment

```sh
uv venv
source .venv/bin/activate
```

```sh
uv venv --python 3.14 ./myvenv
```

Install packages

```sh
uv pip install -r requirements.txt
uv pip install <module>
```

Deactivate venv

```sh
deactivate
```

## Conda

```sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O install.sh
# yes
bash install.sh
rm -f install.sh
```

Disable base env activation

```sh
conda config --set auto_activate_base false
```

Shell command

```zsh
eval "$(<installation/path>/bin/conda shell.zsh hook)"
```

```sh
eval "$(<installation/path>/bin/conda shell.bash hook)"
```

Configuration

```sh
conda config -h
```

Env list

```sh
conda env list
```

Create conda environment

```sh
conda create -n <venv>
```

```sh
conda create -n <venv> python=3.12
```

Activate environment

```sh
conda activate <venv>
```

```sh
conda env list
```

Install packages

```sh
conda install pandas ...
```

```sh
pip install pandas ...
```

Package list

```sh
conda list
```

```sh
pip list
```

Deactivate environment

```sh
conda deactivate
```

Remove environment

```sh
conda env remove -n <venv>
```

## APT package

```sh
sudo apt install -y python3 python3-pip python3-venv python-is-python3
```

## pip package

```sh
pip install --upgrade setuptools pip wheel
```

## pyenv

Install pyenv

```sh
sudo apt install -y git
sudo apt install -y build-essential libbz2-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev tk-dev

# Optional scientific package headers (for Numpy, Matplotlib, SciPy, etc.)
sudo apt install -y libpng-dev libfreetype6-dev
```

```sh
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer -o install.sh

bash install.sh
rm -f install.sh
```

```sh
vi ~/.bashrc
```

```shrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

```sh
exec $SHELL
source ~/.bashrc
```

Install python with pyenv

```sh
pyenv install 3.12
```

```sh
pyenv virtualenv 3.12 general
```

```sh
pyenv global general
```

Uninstall

```sh
pyenv uninstall general
```

Version setup for directory

```sh
pyenv virtualenv 3.12 <project>
```

```sh
pyenv local <project>
```

## Virtual environment

Create virtual environment

```sh
python -m venv <venv>
source <venv>/bin/activate
```

Find required packages

```sh
pip install pip-tools
pip-compile --upgrade --build-isolation --generate-hashes --allow-unsafe --output-file requirements.txt requirements.in
```

Install required packages

```sh
pip install -r requirements.txt
pip install <module>
```

Run application

```sh
python main.py
```

Deactivate venv

```sh
deactivate
```
