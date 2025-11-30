# K6

[Load testing for engineers](https://k6.io/)

## Installation

Snap

```sh
sudo snap install k6
```

Ubuntu

```sh
sudo gpg -k
sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb [signed-by=/etc/apt/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
```

```sh
sudo apt update
sudo apt install -y k6
```
