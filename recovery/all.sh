\#!/bin/sh
# Copyright 2010, 2011 EXO S.A.
# Modificación del Script de Exo adaptado a la imagen de la DTE.

dialog \ 
	--backtitle "RESTAURE EL SISTEMA OPERATIVO DAÑADO DE LA NET :···: PAD · DET · DGCyE · BUENOS AIRES" \
	--title "RESTAURAR Windows 7 y HUAYRA · GNU/LINUX" \ 
	--yesno "Se restauraran los Sistemas Operativos Windows 7 y HUAYRA · GNU/Linux a la imagen original de PAD. La información que se encuentre en la partición de DATOS no sera modificada. Desea continuar?" 10 40 

	if [ $? = "0" ] ; then
		sh /root/restore-seven.sh ; sh /root/restore-gnu.sh ; sh /root/salir.sh
	fi
