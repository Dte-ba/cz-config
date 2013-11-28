\#!/bin/sh
dialog --backtitle "SISTEMA DE RECUPERACION  - DTE BA " \
--title "RESTAURAR GNU/LINUX" --yesno "Se restaurara el Sistema Operativo GNU/Linux a la imagen original de fabrica. La información que se encuentre en la partición de DATOS no sera modificada. Desea continuar?" 10 40 
	if [ $? = "0" ] ; then
	sh /live/image/root/restore-gnu.img ; sh /live/image/root/salir.sh 
	fi
