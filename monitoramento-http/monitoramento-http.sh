#!/bin/bash

# Número de requisições do Apache
requisicoes=$(pgrep apache2 |wc -l)

# Status HTTP da URL (alterar http://localhost para a URL desejada)
status_http=$(curl --write-out %{http_code} --silent --output /dev/null  http://localhost)

# Uso de memória atual
memoria=$(free -h | grep -i mem | awk '{ print $3 }')

# Carga de CPU atual
CPU=$(uptime | cut -d, -f4 |  awk '{ print $3 }')

# O log será registrado em /var/log. Caso o status HTTP for diferente de 200, o Apache será reiniciado registrando o ocorrido
if [ $status_http -eq 200 ]
then
        echo "$(date +%d-%m-%Y,%H:%M:%S) -> Requisicoes = $requisicoes -> Uso de memória = $memoria -> Carga de CPU = $CPU -> O status HTTP é = $status_http" >> /var/log/monitoramento.log
else
        echo "Houve um problema no servidor em $(date +%d-%m-%Y,%H:%M:%S) -> Requisicoes = $requisicoes -> Uso de memória = $memoria -> Carga de CPU = $CPU -> O status HTTP foi = $status_http" >> /var/log/monitoramento.log
        systemctl restart apache2
        echo "Serviço reinicializado em $(date +%d-%m-%Y,%H:%M:%S)" >> /var/log/monitoramento.log
fi
