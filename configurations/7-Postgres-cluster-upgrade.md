# Upgrade PostgreSQL cluster version

## See available cluster

```bash
sudo pg_lsclusters
```

## Merge multiple cluster

Stop new postgres cluster

```bash
sudo pg_dropcluster 16 main --stop
```

Upgrade previous cluster

```bash
sudo pg_upgradecluster 15 main
```

Drop old cluster

```bash
sudo pg_dropcluster 15 main
```

List running clusters

```bash
sudo pg_lsclusters
```

## Remove database packages

```bash
sudo apt purge postgresql-15 postgresql-client-15
```

### PostgreSQL command prompt

```bash
sudo -i -u postgres
> psql
```

See database list

```bash
\list
```

## Remove Postgresql

```bash
dpkg -l | grep postgres
```

```bash
sudo apt-get --purge remove postgresql ...
```

```bash
sudo rm -r /etc/postgresql/
sudo rm -r /etc/postgresql-common/
sudo rm -r /var/lib/postgresql/
```

```bash
sudo userdel -r postgres
sudo groupdel postgres
```
