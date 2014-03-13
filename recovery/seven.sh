\#!/bin/sh
# Copyright 2010, 2011 EXO S.A.
# Modificación del Script de Exo adaptado a la imagen de la DTE.

dialog \ 
	--backtitle "RESTAURE EL SISTEMA OPERATIVO WINDOWS 7 DAÑADO DE LA NET :···: PAD · DET · DGCyE · BUENOS AIRES" \
	--title "RESTAURAR WINDOWS 7" \
	--yesno "Se restaurara el Sistema Operativo MICROSOFT WINDOWS 7 a la imagen original de fabrica. La información que se encuentre en la partición de DATOS no sera modificada. Desea continuar?" 10 40 

	if [ $? = "0" ] ; then
		sh /root/restore-img.sh "seven-img" "sda2" ; sh /root/salir.sh
	fi
