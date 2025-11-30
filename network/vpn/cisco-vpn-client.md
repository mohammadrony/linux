# Cisco VPN Client

## Package setup

```sh
sudo apt install -y openvpn openconnect vpnc network-manager-openconnect-gnome
```

Save [vpnc-script](https://gitlab.com/openconnect/vpnc-scripts/raw/master/vpnc-script) in `/etc/vpnc/vpnc-script` file.

```sh
sudo curl -so /etc/vpnc/vpnc-script https://gitlab.com/openconnect/vpnc-scripts/raw/master/vpnc-script
sudo chmod +x /etc/vpnc/vpnc-script
```

Add `myvpn` function in `~/.bash_functions` and `~/.zsh_functions`.

```sh
myvpn () {
  if [[ $# -gt 0 && $1 == 'vpn1' ]]; then
    VPNUSER=VPN1_USER
    VPNPASS=VPN1_PASS
    VPNURL=VPN1_URL
  elif [[ $# -gt 0 && $1 == 'vpn2' ]]; then
    VPNUSER=VPN2_USER
    VPNPASS=VPN2_PASS
    VPNURL=VPN2_URL
  else
    echo "Available command:"
    echo "myvpn vpn1|vpn2"
    return 0
  fi

  sudo openvpn --mktun --dev tun1 && \
  sudo ifconfig tun1 up && \
  printf "$VPNPASS\nyes" | sudo /usr/sbin/openconnect -s /etc/vpnc/vpnc-script $VPNURL --user=$VPNUSER --passwd-on-stdin --interface=tun1
  sudo ifconfig tun1 down
}
```

Example command

```sh
/opt/cisco/anyconnect/bin/vpn -s connect <host> << EOF
0
<username>
<password>
y
exit
EOF
```
