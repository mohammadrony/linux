# Keep Desktop Alive

Turn off sleep mode

```sh
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

Turn on sleep mode

```sh
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
