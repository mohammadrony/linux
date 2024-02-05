# Database logs

```sql
sqlcmd -U user -P 'password'
```

Find recovery model

```sql
select name, recovery_model_desc FROM sys.databases
GO
```

```sql
SELECT name, log_reuse_wait_desc FROM sys.databases
GO
```

```sql
DBCC SQLPERF(LOGSPACE)
DBCC LOGINFO
GO
```

```sql
SELECT name FROM sys.master_files WHERE type_desc = 'LOG'
GO
```

For SIMPLE recovery model

```sql
-- optional
BACKUP LOG dbname TO mypath
go
```

```sql
USE dbname
DBCC SHRINKFILE (dbname_log, 1)
GO
```

For FULL recovery model

```sql
USE dbname
ALTER DATABASE dbname SET RECOVERY SIMPLE
DBCC SHRINKFILE (dbname_log, 1)
ALTER DATABASE dbname SET RECOVERY FULL
GO
```
