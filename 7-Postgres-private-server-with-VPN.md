# Update PostgreSQL database in a Private VPN Server

## Connect to private server with VPN

### Install OpenVPN package

```bash
sudo apt install -y openvpn
```

### Connect to the VPN

```bash
sudo openvpn --config ~/ssl_vpn_config.ovpn
Username: <username>
Password: <password>
```

### Another session for private server

```bash
ssh -R 1080 root@<ip-address>
password: <password>
```

## Upgrade Postgresql database

### See available cluster

```bash
sudo pg_lsclusters
```

### Stop psql 16

```bash
sudo pg_dropcluster 16 main --stop
```

### Upgrade previous cluster

```bash
sudo pg_upgradecluster 15 main
```

### Drop old cluster

```bash
sudo pg_dropcluster 15 main
```

### Remove old database packages

```bash
sudo apt purge postgresql-15 postgresql-client-15
```

### See available cluster again

```bash
sudo pg_lsclusters
```

## See databases from psql prompt

### Login to Postgresql prompt

```bash
sudo -i -u postgres
> psql
```

### Show database list

```bash
\list
```

Thank you.
