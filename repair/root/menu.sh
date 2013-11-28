#!/bin/sh
MENU="4"
while [ $MENU != '0' ] 
do

	dialog --nocancel --ok-label "Aceptar" \
	--default-item "4" --backtitle "SISTEMA DE RECUPERACION  - DTE BA " --title "Elija la tarea a realizar" \
	--menu  "" 14 50  4\
	"1" "Restaurar Microsoft Windows 7"  \
	"2" "Restaurar GNU/linux" \
	"3" "Restaurar ambos Sistemas Operativos"  \
	"4" "Salir" 2> /tmp/seleccion

	OPCION=$(cat /tmp/seleccion)

	 case $OPCION in
	1 )  sh /live/image/root/seven.sh	;;
	2 )  sh /live/image/root/gnu.sh	;;
	3 )  sh /live/image/root/all.sh	;;
	4 )  sh /live/image/root/salir.sh ;;
	esac
done
