# Restore PostgreSQL database

## Setup PostgreSQL in Ubuntu

### Install SSH

```bash
sudo apt install -y openssh-client openssh-server
sudo systemctl start ssh
```

### Install Postgres 14 and 15

```bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo wget -O /etc/apt/trusted.gpg.d/postgresql.asc https://www.postgresql.org/media/keys/ACCC4CF8.asc
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg -
sudo apt update; sudo apt upgrade -y
sudo apt install -y postgresql-14 postgresql-15
```

## Restore database from backup

### Download the tar file

```bash
scp prod.hrythmic.com:~/hrythmic-psql-data.tar.gz ./
```

### Copy database file

```bash
tar -xvf postgres-data.tar.gz
cd ./postgresql
sudo cp 14 /var/lib/postgresql/ -r
sudo cp 15 /var/lib/postgresql/ -r
```

### Update database permission

```bash
cd /var/lib/postgresql/
sudo chown postgres:postgres -R ./
```

### Restart database service

```bash
sudo systemctl restart postgresql
sudo systemctl status postgresql
```

## Merge multiple database cluster

### See available cluster

```bash
pg_ctlcluster 14 main start
```

```bash
sudo pg_lsclusters
```

### Upgrade cluster version

```bash
sudo pg_dropcluster 15 main --stop
sudo pg_upgradecluster 14 main
sudo pg_dropcluster 14 main

```

### Remove postgresql 14 packages

```bash
sudo apt purge -y postgresql-14 postgresql-client-14
```

## Transfer database as file

### Export database to SQL file

```bash
sudo -i -u postgres
pg_dump shrimp_prod > hrythmic_prod_db.sql
exit
```

### Copy this file to target server

```bash
scp hrythmic_prod_db.sql prod.hrythmic.com:~/
```

### Import database from SQL file

```bash
sudo -u postgres psql --port 5432
> CREATE DATABASE hrythmic_prod;
psql hrythmic_prod < hrythmic_prod_db.sql
```

## Some SQL commands

Login to postgres command prompt

```bash
sudo -u postgres psql
# sudo -u postgres psql --port 5432
# sudo -u postgres psql -c 'command'
# sudo -iu postgres; psql -d postgres -c 'command'
```

Create new user

```psql
CREATE USER rony WITH PASSWORD '<password>';
or
CREATE ROLE rony SUPERUSER LOGIN PASSWORD '<password>';
CREATE DATABASE db_name;
```

See databases

```psql
\list
```

Connect to database

```psql
\c hrythmic_prod
\dt
```

Update user permission

```psql
ALTER USER rony WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE db_name TO rony;
GRANT ALL PRIVILEGES ON SCHEMA public TO rony;
```

See user permissions

```psql
\du+
\dn+
```

Delete user with permission

```psql
ALTER USER rony WITH NOSUPERUSER;
REVOKE ALL PRIVILEGES ON DATABASE db_name FROM rony;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM rony;
DROP DATABASE IF EXISTS db_name;
DROP USER IF EXISTS rony;
```

Drop Database and connection

```psql
REVOKE CONNECT ON DATABASE db_name FROM public;
SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'db_name';
DROP DATABASE db_name;
```
