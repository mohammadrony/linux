# Journald

```sh
journalctl
```

```sh
journalctl | grep -i sshd
```

```sh
journalctl --since yesterday
```

```sh
journalctl --since "2024-01-01 00:00:00" --until "2024-01-02 00:00:00"
```

Cleanup

```sh
journalctl --disk-usage
```

```sh
sudo journalctl --vacuum-size=1G
```
