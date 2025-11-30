# DaVinci Resolve

[Download file](https://www.blackmagicdesign.com/products/davinciresolve/)

Install dependencies

```sh
sudo apt install -y ocl-icd-opencl-dev fakeroot xorriso
```

```sh
sudo apt install -y libxcb-cursor0 libasound2t64 libapr1t64 libaprutil1t64
```

```sh
sudo ln -sf /usr/lib/x86_64-linux-gnu/libapr-1.so.0 /usr/lib/x86_64-linux-gnu/libapr-1.so
sudo ln -sf /usr/lib/x86_64-linux-gnu/libaprutil-1.so.0 /usr/lib/x86_64-linux-gnu/libaprutil-1.so
sudo ln -sf /usr/lib/x86_64-linux-gnu/libasound.so.2 /usr/lib/x86_64-linux-gnu/libasound.so
```

```sh
sudo apt install -y dbus-x11 alsa-utils pulseaudio  
```

Unarchive package

```sh
unzip DaVinci_Resolve_x.x.x_Linux.zip
```

Install the application

```sh
sudo ./DaVinci_Resolve_x.x.x_Linux.run -i
# sudo SKIP_PACKAGE_CHECK=1 ...
```
