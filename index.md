## Bem vindo(a) ao plugin Kubectl para Drone CI

O plugin Kubectl Drone CI é utilizado para você executar comandos kubectl em sua step.
### Pipeline
```markdown
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
