# yq

```bash
sudo snap install yq
```

```bash
yq e -i '.spec.type="NodePort"' service.yaml
yq e -i '.spec.ports[0].nodePort = PORT_NUMBER' service.yaml
```
