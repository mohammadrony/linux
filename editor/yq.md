# yq

Installation

```sh
sudo snap install yq
```

## Commands

json to yaml

```sh
yq -P output.json
```

```sh
cat output.json | yq -P
```

Edit yaml

```sh
yq e -i '.spec.type="NodePort"' service.yaml
yq e -i '.spec.ports[0].nodePort = PORT_NUMBER' service.yaml
```
