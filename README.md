# Plugin Kubectl para Drone CI

[![Build Status](https://cloud.drone.io/api/badges/plugindrone/kubectl/status.svg)](https://cloud.drone.io/plugindrone/kubectl)
<a href="https://github.com/plugindrone/kubectl/stargazers">
	<img src="https://img.shields.io/github/stars/plugindrone/kubectl" alt="Stars Badge"/>
</a>
<a href="https://github.com/plugindrone/kubectl/network/members">
	<img src="https://img.shields.io/github/forks/plugindrone/kubectl" alt="Forks Badge"/>
</a>
<a href="https://github.com/plugindrone/kubectl/issues">
	<img src="https://img.shields.io/github/issues/plugindrone/kubectl" alt="Issues Badge"/>
</a>
<a href="https://github.com/plugindrone/kubectl/graphs/contributors">
	<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/plugindrone/kubectl?color=2b9348">
</a>
<a href="https://github.com/plugindrone/kubectl/blob/master/LICENSE">
	<img src="https://img.shields.io/github/license/plugindrone/kubectl?color=2b9348" alt="License Badge"/>
</a>

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