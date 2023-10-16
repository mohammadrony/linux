# Restore postgreSQL database from file

## Create new user

```bash
sudo -u postgres psql # Switch into database command prompt
# sudo -u postgres psql -c 'command' # Run database commands as any user
# sudo -iu postgres; psql -d postgres -c 'command' # Run commands from postgres user prompt
> CREATE USER rony WITH PASSWORD '<password>';
or
> CREATE ROLE rony SUPERUSER LOGIN PASSWORD '<password>';
> CREATE DATABASE db_name; 
```

## Update user permission

```bash
sudo -u postgres psql # Switch into database command prompt
# sudo -u postgres psql -c 'command' # Run database commands as any user
# sudo -iu postgres; psql -d postgres -c 'command' # Run commands from postgres user prompt
> ALTER USER rony WITH SUPERUSER;
> GRANT ALL PRIVILEGES ON DATABASE db_name TO rony;
> GRANT ALL PRIVILEGES ON SCHEMA public TO rony;
```

## See user permissions

```bash
sudo -u postgres psql # Switch into database command prompt
# sudo -u postgres psql -c 'command' # Run database commands as any user
# sudo -iu postgres; psql -d postgres -c 'command' # Run commands from postgres user prompt
> \du+
> \dn+
```

## Delete user with permission

```bash
sudo -u postgres psql # Switch into database command prompt
# sudo -u postgres psql -c 'command' # Run database commands as any user
# sudo -iu postgres; psql -d postgres -c 'command' # Run commands from postgres user prompt
> ALTER USER rony WITH NOSUPERUSER;
> REVOKE ALL PRIVILEGES ON DATABASE db_name FROM rony;
> REVOKE ALL PRIVILEGES ON SCHEMA public FROM rony;
> DROP DATABASE IF EXISTS db_name;
> DROP USER IF EXISTS rony;
```

## Download the tar file

```bash
scp prod.hrythmic.com:~/hrythmic-psql-data.tar.gz ./
```

## Setup local Ubuntu 23

```bash
sudo apt install -y openssh-client openssh-server
sudo systemctl start ssh
```

## Install postgres 14 and 15

```bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update -y; sudo apt upgrade -y
sudo apt install -y postgresql-14 postgresql-15
```

## Copy database file

```bash
tar -xvf postgres-data.tar.gz
cd ./postgresql
sudo cp 14 /var/lib/postgresql/ -r
sudo cp 15 /var/lib/postgresql/ -r
```

## Update database permission

```bash
cd /var/lib/postgresql/
sudo chown postgres:postgres -R ./
```

## Restart database service

```bash
sudo systemctl restart postgresql
sudo systemctl status postgresql
```

## See available cluster

```bash
sudo pg_lsclusters
```

## Update database cluster version

```bash
sudo pg_dropcluster 15 main --stop
sudo pg_upgradecluster 14 main
sudo pg_dropcluster 14 main

```

## Remove postgresql 14 packages

```bash
sudo apt purge -y postgresql-14 postgresql-client-14
```

## Export database

```bash
sudo -i -u postgres
pg_dump shrimp_prod > hrythmic_prod_db.sql
exit
```

## Copy sql file to prod server

```bash
scp hrythmic_prod_db.sql prod.hrythmic.com:~/
```

## Restore database

```bash
sudo -i -u postgres
psql
> CREATE DATABASE hrythmic_prod;
psql hrythmic_prod < hrythmic_prod_db.sql
```

## See databases

```bash
sudo -u postgres psql
> \c hrythmic_prod; 
> \dt;
```

## Drop Database with connection

```psql
REVOKE CONNECT ON DATABASE db_name FROM public;

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'db_name';

DROP DATABASE db_name;
```

Thank you.
