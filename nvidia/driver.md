# Nvidia Driver

## Ubuntu

- [NVIDIA drivers installation](https://documentation.ubuntu.com/server/how-to/graphics/install-nvidia-drivers/index.html)

Check driver version

```sh
cat /proc/driver/nvidia/version
```

Check available drivers

```sh
sudo ubuntu-drivers list # desktop
sudo ubuntu-drivers list --gpgpu # server
```

Installing drivers for generic use

```sh
sudo ubuntu-drivers install # desktop
sudo ubuntu-drivers install --gpgpu # server
```

Installing specific version

```sh
version=590
sudo ubuntu-drivers install --gpgpu nvidia:$version-server
sudo apt install nvidia-utils-$version-server
```

Optional step

```sh
# Applicable for NVswitch hardware
sudo apt install nvidia-fabricmanager-$version libnvidia-nscq-$version
```

## Container Toolkit

- [Installing the NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

Configure production repository

```sh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

```sh
sudo apt update
sudo apt install -y nvidia-container-toolkit
```

Configure container runtime

```sh
sudo nvidia-ctk runtime configure --runtime=docker
```

```sh
sudo systemctl restart docker
```
