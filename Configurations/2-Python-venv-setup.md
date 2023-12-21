# Setup Python Virtual Environment for Development

## Install required packages for Ubuntu

```bash
sudo apt install -y python3 python3-pip python3-venv python-is-python3
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
