# wireshark

Installation

```sh
sudo apt install -y wireshark tshark
```

## Commands

Capture remote server packet

```sh
ssh <user>@<host> 'tshark -f "port !22" -w -' | wireshark -k -i -
```
