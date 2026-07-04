# OpenVPN

## Package setup

```sh
sudo apt install -y openvpn network-manager-openvpn-gnome
```

## Connect

```sh
sudo openvpn --config client.ovpn
```

Run in background

```sh
sudo openvpn --config client.ovpn --daemon
```
