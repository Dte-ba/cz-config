\#!/bin/sh
dialog --backtitle "SISTEMA DE RECUPERACION  - DTE BA " \
--title "AVISO IMPORTANTE" --yesno "Mediante esta herramienta Usted puede restaurar las particiones de los Sistemas Operativos a las imagenes originales de fabrica. La informacion que se encuentre en la particion de DATOS no sera modificada. Sin embargo cualquier dato que haya sido salvado en las particiones de los Sistemas Operativos se perdera definitivamente. Desea continuar?" 0 0 
	if [ $? = "1" ] ; then
	sh /live/image/root/salir.sh
	 else
	sh /live/image/root/menu.sh 
	fi
