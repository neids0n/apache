## 👤 usuarios-aplicacoes.sh 

Script para criação de usuário com acesso a determinada aplicação Apache em /var/www/html

## :hammer_and_wrench: O usuário é criado da seguinte forma:

- Sem pasta home
- Sem grupo do usuário
- Utilizando o bash como shell
- Logando direto na pasta da aplicação

## ✔️ O script executa as seguintes ações:

- Solicita o nome do diretório da aplicação em /var/www/html
- Verifica se a pasta da aplicação existe
- Criação do usuário
- Adição do usuário em um grupo especificado