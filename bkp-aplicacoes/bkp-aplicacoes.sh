#!/bin/bash

#Solicita o nome do diretório em /var/www/html
echo "Informe o nome do diretório da aplicação em /var/www/html: "
read dir_name

#Verifica se o diretório existe
if [ ! -d "/var/www/html/$dir_name" ]; then
	echo "Erro: Diretório $dir_name não encontrado em /var/www/html/"
	exit 1
fi

#Verifica se já existe um arquivo .tar.gz com o nome do diretório. Se existir, deleta o arquivo
if [ -f "/var/www/html/$dir_name.tar.gz" ]; then
	rm "/var/www/html/$dir_name.tar.gz"
	echo "Arquivo $dir_name.tar.gz deletado."
fi

#Entra no diretório /var/www/html/ e compacta o diretório informado
cd /var/www/html/
tar czf "$dir_name.tar.gz" "$dir_name"
echo "Diretório $dir_name compactado com sucesso!"