\#!/bin/sh
dialog --backtitle "SISTEMA DE RECUPERACION  - DTE BA " \
--title "TAREA FINALIZADA" --msgbox "SE REINICIARA EL EQUIPO " 5 30
	if [ $? = "0" ] ; then
	reset; reboot
	fi
