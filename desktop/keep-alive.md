# Keep Desktop Alive

Turn off sleep mode

```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

Turn on sleep mode

```bash
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
