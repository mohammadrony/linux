# wireshark

Installation

```bash
sudo apt install -y wireshark tshark
```

## Commands

Capture remote server packet

```bash
ssh <user>@<host> 'tshark -f "port !22" -w -' | wireshark -k -i -
```
