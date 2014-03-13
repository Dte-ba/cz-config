\#!/bin/sh
# Copyright 2010, 2011 EXO S.A.
# Modificación del Script de Exo adaptado a la imagen de la DTE.

dialog \
	--backtitle "RESTAURE EL SISTEMA OPERATIVO DAÑADO DE LA NET :···: PAD · DET · DGCyE · BUENOS AIRES" \
	--title "TAREA FINALIZADA" \
	--msgbox "SE REINICIARA EL EQUIPO " 5 30

	if [ $? = "0" ] ; then
		reset; reboot
	fi
