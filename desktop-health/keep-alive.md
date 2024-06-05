# Keep Desktop Alive

Turn off sleep mode

```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

Turn on sleep mode

```bash
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

Send notification

```bash
while sleep 1h; do notify-send hello; done
```
