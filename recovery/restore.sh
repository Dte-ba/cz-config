\#!/bin/sh
# Copyright 2010, 2011 EXO S.A.
# Modificación del Script de Exo adaptado a la imagen de la DTE.

dialog \
	--backtitle "RESTAURE EL SISTEMA OPERATIVO DAÑADO DE LA NET :···: PAD · DET · DGCyE · BUENOS AIRES" \
	--title "ESTE AVISO ES IMPORTANTE" \ 
	--yesno "Mediante esta herramienta Usted puede restaurar las particiones de los Sistemas Operativos a las imagenes originales de fabrica. La informacion que se encuentre en la particion de DATOS no sera modificada. Sin embargo cualquier dato que haya sido salvado en las particiones de los Sistemas Operativos se perdera definitivamente. Desea continuar?" 0 0 

if [ $? = "1" ] ; then
	sh /root/salir.sh
 else
	sh /root/menu.sh 
fi
