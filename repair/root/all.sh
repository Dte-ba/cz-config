\#!/bin/sh
dialog --backtitle "SISTEMA DE RECUPERACION  - DTE BA " \
--title "RESTAURAR Windows 7 y GNU/LINUX" --yesno "Se restauraran los Sistemas Operativos Windows 7 y GNU/Linux a la imagen original de fabrica. La información que se encuentre en la partición de DATOS no sera modificada. Desea continuar?" 10 40 
	if [ $? = "0" ] ; then
	sh /live/image/root/restore-seven.img ; sh /live/image/root/restore-gnu.img ; sh /live/root/salir.sh
	fi
