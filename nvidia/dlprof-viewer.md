# DLProf Viewer

## Install using Python Wheel

Create virtual environment

```sh
python -m venv venv
source venv/bin/activate
```

Install required packages

```sh
pip install setuptools pip wheel
```

```sh
pip install nvidia-pyindex
```

```sh
pip install nvidia-dlprof
```

## TensorFlow Containers

[Tags](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tensorflow/tags)

```sh
docker pull nvcr.io/nvidia/tensorflow:<25.02>-tf2-py3
```

```sh
docker run --rm --gpus=1 --shm-size=1g --ulimit memlock=-1 \
--ulimit stack=67108864 -it -p8000:8000 -v/full/path/to/training/data:/data \
nvcr.io/nvidia/tensorflow:25.02-tf2-py3
```

```sh
dlprof python <training-script.py>
```
