#!/bin/sh

echo "Plugin Kubectl Versão $VERSAO"
echo

if [ -z "$PLUGIN_KUBE_CONFIG" ]; then
    echo "###### ERRO ######"
    echo "O parametro settings.kube_config não foi informado. Esse parâmetro é necessário para que o kubectl consiga executar comandos no cluster kubernetes."
    echo
    echo "Para maiores informações consulte: https://github.com/goudev/kubectl"
    echo
    exit 2
else

    # Define a env KUBE_CONFIG
    export KUBE_CONFIG=/home/kubectl/.kube/config
    
    # Cria o diretório do arquivo
    mkdir /home/kubectl/.kube

    # Validamos se o KUBE_CONFIG foi passado em base64
    if [ -z "$PLUGIN_KUBE_CONFIG_ENCODED" ]; then
        printenv PLUGIN_KUBE_CONFIG | base64 -d > ${KUBE_CONFIG}
    else
        printenv PLUGIN_KUBE_CONFIG > ${KUBE_CONFIG}
    fi
    
    # Salvamos a lista de comandos em um arquivo
    printenv PLUGIN_CMD | sed 's/","/"\n"/g' | sed "s/','/'\n'/g" | sed 's/,/\n/g' > /tmp/cmd
    
    TOTAL_LINHAS=$(wc -l /tmp/cmd | awk '{print $1}')
    for i in `seq 1 ${TOTAL_LINHAS}`; do
        COMANDO_ATUAL=$(sed -n ${i}p /tmp/cmd)
        if [ "$PLUGIN_DEBUG" == "1" ]; then
            echo
            echo "** Executando o comando: ($COMANDO_ATUAL)"
        fi
        ${COMANDO_ATUAL}
        if [ ! $? = 0 ]; then
            if [ "${PLUGIN_IGNORE_ERRORS}" == "1" ]; then
                echo
                echo "** Ignorando erros por conta do parametro ignore_errors=1"
            else
                exit 2;
            fi
        fi
    done
fi