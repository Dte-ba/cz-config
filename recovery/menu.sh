#!/bin/sh
# Copyright 2010, 2011 EXO S.A.
# Modificación del Script de Exo adaptado a la imagen de la DTE.

MENU="4"

while [ $MENU != '0' ] 
do

	dialog --nocancel --ok-label "Aceptar" \
	--default-item "4" --backtitle "RESTAURE EL SISTEMA OPERATIVO DAÑADO DE LA NET :···: PAD · DET · DGCyE · BUENOS AIRES " \ 
	--title "Elija que tarea desea realizar" \
	--menu  "" 14 50  4 \
	"1" "Restaurar Microsoft Windows 7 PAD"  \
	"2" "Restaurar HUAYRA GNU/linux" \
	"3" "Restaurar ambos Sistemas Operativos"  \
	"4" "Salir" 2> /tmp/seleccion

	OPCION=$(cat /tmp/seleccion)

	case $OPCION in
	1 )  sh /root/seven.sh	;;
	2 )  sh /root/gnu.sh	;;
	3 )  sh /root/all.sh	;;
	4 )  sh /root/salir.sh ;;
	esac
done
