# yq

Installation

```bash
sudo snap install yq
```

json to yaml

```bash
yq -P output.json
```

```bash
cat output.json | yq -P
```

Edit yaml

```bash
yq e -i '.spec.type="NodePort"' service.yaml
yq e -i '.spec.ports[0].nodePort = PORT_NUMBER' service.yaml
```
