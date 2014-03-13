\#!/bin/sh
# Copyright 2010, 2011 EXO S.A.
# Modificación del Script de Exo adaptado a la imagen de la DTE.

dialog \
	--backtitle "RESTAURE EL SISTEMA OPERATIVO DAÑADO DE LA NET :···: PAD · DET · DGCyE · BUENOS AIRES" \
	--title "RESTAURAR GNU/LINUX" \ 
	--yesno "Se restaurará el Sistema Operativo HUAYRA GNU/Linux a la imagen original deL PAD. La información que se encuentre en la partición de DATOS no sera modificada. Desea continuar?" 10 40 

	if [ $? = "0" ] ; then
		sh /root/restore-gnu.sh "gnu-img" "sda3" ; sh /root/salir.sh 
	fi
