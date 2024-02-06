# Docker Files

```bash
docker rmi <IMAGE>
```

```bash
sudo docker system prune -a -f
```

```bash
sudo docker volume rm $(docker volume ls -qf dangling=true)
```
