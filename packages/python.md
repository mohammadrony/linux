# Python

## UV

```bash
curl -LO https://astral.sh/uv/install.sh

bash install.sh
rm -f install.sh
```

Commands

```bash
uv
```

Create virtual environment

```bash
uv venv
source .venv/bin/activate
```

Install packages

```bash
uv pip install -r requirements.txt
uv pip install <module>
```

Deactivate venv

```bash
deactivate
```

## Conda

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O install.sh
# yes
bash install.sh
rm -f install.sh
```

Disable base env activation

```bash
conda config --set auto_activate_base false
```

Shell command

```zsh
eval "$(<installation/path>/bin/conda shell.zsh hook)"
```

```bash
eval "$(<installation/path>/bin/conda shell.bash hook)"
```

Configuration

```bash
conda config -h
```

Env list

```bash
conda env list
```

Create conda environment

```bash
conda create -n <venv>
```

```bash
conda create -n <venv> python=3.12
```

Activate environment

```bash
conda activate <venv>
```

```bash
conda env list
```

Install packages

```bash
conda install pandas ...
```

```bash
pip install pandas ...
```

Package list

```bash
conda list
```

```bash
pip list
```

Deactivate environment

```bash
conda deactivate
```

Remove environment

```bash
conda env remove -n <venv>
```

## APT package

```bash
sudo apt install -y python3 python3-pip python3-venv python-is-python3
```

## pip package

```bash
pip install --upgrade setuptools pip wheel
```

## pyenv

Install pyenv

```bash
sudo apt install -y git
sudo apt install -y build-essential libbz2-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev tk-dev

# Optional scientific package headers (for Numpy, Matplotlib, SciPy, etc.)
sudo apt install -y libpng-dev libfreetype6-dev
```

```bash
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer -o install.sh

bash install.sh
rm -f install.sh
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

Install python with pyenv

```bash
pyenv install 3.12
```

```bash
pyenv virtualenv 3.12 general
```

```bash
pyenv global general
```

Uninstall

```bash
pyenv uninstall general
```

Version setup for directory

```bash
pyenv virtualenv 3.12 <project>
```

```bash
pyenv local <project>
```

## Virtual environment

Create virtual environment

```bash
python -m venv <venv>
source <venv>/bin/activate
```

Install required packages

```bash
pip install -r requirements.txt
pip install <module>
```

Run application

```bash
python main.py
```

Deactivate venv

```bash
deactivate
```
