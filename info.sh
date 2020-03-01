#!/bin/bash
# Menu SystemInfo 1.0 by fomes
clear
echo "
Escolha uma opção:
    1. Mostrar Informações do sistema
    2. Mostrar espaço em disco
    3. Mostrar espaço em disco no diretório home
    0. Sair
"
read -p "Enter selection [0-3] > "

if [[ $REPLY =~ ^[0-3]$ ]]; then
	if [[ $REPLY == 0 ]]; then
		echo "Programa Finalizado."
		exit
	fi
	if [[ $REPLY == 1 ]]; then
		echo "Hostname: $HOSTNAME"
		uptime
		exit
	fi
	if [[ $REPLY == 2 ]]; then
		df -h
		exit
	fi
	if [[ $REPLY == 3 ]]; then
		if [[ $(id -u) -eq 0 ]]; then
			echo "Espaço utilizado em home (All Users)"
			du -sh /home/*
		else
			echo "Espaço utilizado em home ($USER)"
			du -sh $HOME
		fi
		exit
	fi
else
	echo "Opção inválida." >&2
	exit 1
fi