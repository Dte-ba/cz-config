\#!/bin/sh
dialog --backtitle "SISTEMA DE RECUPERACION - DTE BA " \
--title "RESTAURAR WINDOWS 7" --yesno "Se restaurara el Sistema Operativo MICROSOFT WINDOWS 7 a la imagen original de fabrica. La información que se encuentre en la partición de DATOS no sera modificada. Desea continuar?" 10 40 
	if [ $? = "0" ] ; then
	sh /live/image/root/restore-seven.img ; sh /live/image/root/salir.sh
	fi
