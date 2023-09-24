## 📈 monitoramento-http.sh 

Script para monitoramento de número de requisições do Apache, status HTTP, uso de memória e carga de CPU

## ✔️  O script executa as seguintes ações:

- Captura o número de requisições do Apache 
- Captura o status HTTP da URL informada
- Captura a utilização da memória RAM atual 
- Captura a carga de CPU atual

→ O log será registrado em /var/log. Caso o status HTTP for diferente de 200, o Apache será reiniciado registrando o ocorrido
