# Plugin Kubectl para Drone CI

[![Build Status](https://cloud.drone.io/api/badges/plugindrone/kubectl/status.svg)](https://cloud.drone.io/plugindrone/kubectl)

Este plugin para o Drone, permite executar comandos kubectl em sua step. 

## Drone Pipeline
```yaml
steps:

- name: kubectl
  image: plugindrone/kubectl
  settings:
    kube_config: 
      from_secret: kube_config
    cmd: 
    - kubectl get nodes
    - kubectl get namepsaces
```
## Executando o plugin manualmente

```shell
docker run --rm \
  -e PLUGIN_CMD="kubectl get nodes"
  -e PLUGIN_KUBE_CONFIG="$(cat ~/.kube/config)" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  plugindrone/kubectl
```