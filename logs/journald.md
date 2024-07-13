# Journald

```bash
journalctl
```

```bash
journalctl | grep -i sshd
```

```bash
journalctl --since yesterday
```

```bash
journalctl --since "2024-01-01 00:00:00" --until "2024-01-02 00:00:00"
```

Cleanup

```bash
sudo journalctl --vacuum-size=1G
```
