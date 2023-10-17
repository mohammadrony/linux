# Deploy Application to EKS cluster with GitHub Actions

## Setup EKS management host

### Install kubectl

```bash
curl --remote-name
"https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.13/2023-05-11/bin/linux/amd64/ku
bectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/
kubectl version --client=true --output=yaml
```

### Install eksctl

```bash
curl --location
"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz --directory /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```

### Install awscli

```bash
curl --output "awscliv2.zip" "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
unzip awscliv2.zip
sudo ./aws/install
```

### Add an alias for kubectl

```bash
echo 'alias k="kubectl"' > ~/.bashrc
```

## Create EKS cluster with eksctl

### Create cluster

```bash
eksctl create cluster -f 1-eksctl-autoscaling-cluster.yml
```

### Setup autoscaler

```bash
kubectl apply -f 2-cluster-autoscaler-autodiscover.yaml
```

## Deploy a microservice application

### Download deployment configuration

```bash
sudo dnf install subversion
svn checkout https://github.com/microservices-demo/microservices-demo/trunk/deploy/kubernetes/manifests
```

### Publish the application

```bash
kubectl apply -f manifests/
```

### Scale current deployment

```bash
kubectl scale deploy -n sock-shop --replicas=2 --all
```
