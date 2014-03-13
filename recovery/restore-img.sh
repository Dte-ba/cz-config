#!/bin/sh
# Copyright 2010, 2011 EXO S.A.
# Modificación del Script de Exo adaptado a la imagen de la DTE.
IMAGE_NAME=$1
DISK_PARTITION=$2
OCS_COMMANDS=-g auto -e1 auto -e2 -b -r -j2 -k -p true restoreparts

/opt/drbl/sbin/ocs-sr $OCS_COMMANDS $IMAGE_NAME $DISK_PARTITION
