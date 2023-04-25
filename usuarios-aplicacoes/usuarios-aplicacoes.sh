#!/bin/bash

# Solicita o nome do diretório da aplicação 
echo "Informe o nome do diretório da aplicação em /var/www/html que o usuário terá acesso: "
read app_name

# Verifica se a pasta da aplicação existe
if [ ! -d "/var/www/html/$app_name" ]; then
        echo "Erro: Aplicação $app_name não encontrada em /var/www/html/"
        exit 1
fi


# Solicita o nome do usuário
echo "Informe o nome do usuário: "
read user_name

# Solicita a descrição do usuário
echo -e "\nInforme uma descrição para o usuário: "
read user_comment

# Criação do usuário
useradd --badname -M -N -s /bin/bash -d /var/www/html/$app_name -c "$user_comment" $user_name

echo -e "\n\nUsuário $user_name criado com sucesso!"

# Solicita nome de um grupo, verifica se o mesmo existe e adiciona o usuário ao grupo
grupo(){
	echo -e "\n\nAdicione o nome do grupo que o usuário fará parte: "
	read group_name
	checar_grupo=$(cut -d : -f 1 /etc/group |grep -w $group_name)
	if [ $?  -ne 0 ]
	then
		echo -e "Grupo não encontrado\n"
		grupo
	else
		usermod -aG $group_name $user_name
		echo -e "Usuário adicionado ao grupo $group_name\n"
	fi
}

grupo
if [ $? -eq 0 ]
then
	echo -e "\n\nUtilize o comando \"passwd $user_name\" para criar uma senha o novo usuário\n."
else
	echo "Houve algum problema"
fi