# Build and Publish Node application in AWS ECR

## Install Docker and Node in Ubuntu

### Install Node 20

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt update -y
sudo apt install -y nodejs
```

### Install Docker

```bash
sudo apt install -y docker
sudo usermod -aG docker mdrony
sudo chmod 777 /var/run/docker.sock
```

## Prepare a Docker image with Dockerfile

```bash
docker build -t nodeapp .
```

## Add file for Github actions

```bash
mkdir .github/workflows/
cp github-actions-cd.yml .github/workflows/cd.yml
```

## Publish the application to Github

```bash
git add .
git commit -m "Update deployment files."
git checkout -b <branch>
git push origin <branch>
```

Thank you.
