#!/bin/sh

if [ -z "$PLUGIN_KUBE_CONFIG" ]; then
    echo "###### ERRO ######"
    echo "O parametro settings.kube_config não foi informado. Esse parâmetro é necessário para que o kubectl consiga executar comandos no cluster kubernetes."
    echo
    echo "Para maiores informações consulte: https://github.com/plugindrone/kubectl"
    echo
    exit 2
else
    mkdir ~/.kube
    printenv PLUGIN_KUBE_CONFIG > ~/.kube/config
    printenv PLUGIN_CMD | sed 's/","/"\n"/g' | sed "s/','/'\n'/g" | sed 's/,/\n/g' > /tmp/cmd
    chmod +x /tmp/cmd
    cat /tmp/cmd
    source /tmp/cmd
fi