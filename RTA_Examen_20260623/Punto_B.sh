#!/bin/bash

USUARIOPASS=$1
LISTA=$2

	
ANT_IFS=$IFS
IFS=$'\n'
HASH=$(sudo grep "^$USUARIOPASS:" /etc/shadow | awk -F ':' '{print $2}')

for LINEA in `cat $LISTA |  grep -v ^#`
do
	
	
	USUARIO=$(echo  $LINEA |awk -F ',' '{print $1}')
	GRUPO=$(echo  $LINEA |awk -F ',' '{print $2}')
	HOMEUSR=$(echo  $LINEA |awk -F ',' '{print $3}')
	sudo groupadd $GRUPO
	
	sudo mkdir $HOMEUSR

	sudo useradd  -s /bin/bash -g $GRUPO -d $HOMEUSR -p $HASH $USUARIO

done

IFS=$ANT_IFS



