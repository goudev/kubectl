## Bem vindo(a) ao plugin Kubectl para Drone CI

O plugin Kubectl Drone CI é utilizado para você executar comandos kubectl em sua step.
### Pipeline
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
### Testando local com Docker

Você também pode realizar testes utilizando localmente com o docker:

```shell
docker run --rm \
  -e PLUGIN_CMD="kubectl get nodes"
  -e PLUGIN_KUBE_CONFIG="$(cat ~/.kube/config)" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  plugindrone/kubectl
```
