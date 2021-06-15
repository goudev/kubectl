## Plugin Drone kubectl

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

Este plugin para o Drone, permite que você execute comandos kubectl em sua step informando seu arquivo kubeconfig. 

* **settings.ignore_errors**: Parametro que quando setado para 1 ignora qualquer erro de execução do comando (não falha o build). Por padrão vem desativado (não ignora erros);
* **settings.kube_config**: Conteúdo do arquivo kubeconfig para acesso ao cluster kubernetes; 
* **settings.cmd**: Comando ou lista de comandos a serem executados.


## Drone Pipeline

```yaml
steps:

- name: kubectl
  image: plugindrone/kubectl
  settings:
  + ignore_errors: "1"
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

## Gostou do conteúdo deste trabalho?
Sinta-se livre para fazer qualquer doação para a chave **bb39260c-1bce-4cd3-9d70-b74b9dd584da** . 
