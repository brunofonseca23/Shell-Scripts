#!/bin/bash

#SCRIPT PARA AUTOMATIZAR A CRIAÇÃO DE USUÁRIOS NO SISTEMA 

touch /home/regras.txt

funcao=$1

if [ $funcao = "professor" ];then
	addgroup professores
	nome=$2
	if [ -z "$(cat /etc/passwd | cut -d ':' -f1 | grep -w $nome)" ];then

		adduser -home /home/professores/$nome -shell /bin/bash $nome
		addgroup $nome professores
		cp /home/regras.txt /home/professores/$nome/
		passwd -e $nome
		data=$(date +'%d de %h de %Y às %H:%M:%S')
		echo -e "Olá $nome, bem vindo ao IFRN!\nSeu cargo no instituto é $funcao\nSeu cadastro foi realizado em: ${data}" > /home/professores/$nome/welcome_$nome.txt
			
	else
		echo "USUÁRIO JÁ CADASTRADO"

	fi	

elif [ $funcao = "tecnico" ];then
	addgroup tecnicos
	nome=$2
	if [ -z "$(cat /etc/passwd | cut -d ':' -f1 | grep -w $nome)" ]; then

		adduser -home /home/tecnicos/$nome -shell /bin/bash $nome
		addgroup $nome tecnicos
		cp /home/regras.txt /home/tecnicos/$nome/
		passwd -e $nome
		data=$(date +'%d de %h de %Y às %H:%M:%S')
		echo -e "Olá $nome, bem vindo ao IFRN!\nSeu cargo na instituto é $funcao\nSeu cadastro foi realizado em: ${data}" > /home/tecnicos/$nome/welcome_$nome.txt
	else
		echo "USUÁRIO JÁ CADASTRADO"

	fi

elif [ $funcao = "aluno" ];then
	addgroup alunos
	nome=$2
	if [ -z "$(cat /etc/passwd | cut -d ':' -f1 | grep -w $nome)" ];then
	
		adduser -home /home/alunos/$nome -shell /bin/bash $nome
		addgroup $nome alunos
		cp /home/regras.txt /home/alunos/$nome/
		passwd -e $nome
		data=$(date +'%d de %h de %Y às %H:%M:%S')
		echo -e "Olá $nome, bem vindo ao IFRN!\nVocê é $funcao no instituto\nSeu cadastro foi realizado em: ${data}" > /home/alunos/$nome/welcome_$nome.txt

	else
		echo "USUÁRIO JÁ CADASTRADO"
	fi

else
	echo "OPÇÃO INVÁLIDA"
fi
