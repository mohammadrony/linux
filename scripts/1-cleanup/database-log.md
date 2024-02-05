# Database logs

Find recovery model

```sql
select NAME, recovery_model_desc FROM sys.databases
GO
```

```sql
SELECT NAME, log_reuse_wait_desc FROM sys.databases
GO
```

```sql
DBCC SQLPERF(LOGSPACE)
DBCC LOGINFO
GO
```

For SIMPLE recovery model

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
