#!/bin/bash




while true; do

	

	Date=$(date +"%A %d-%m-%y %H:%M")
	#Volum=$(amixer get Master | awk -F'[][]' 'END{ print $2 }')
	Lang=$(setxkbmap -query | awk '/layout/{ print $2 }')
	FreeMem=$(free -h | awk '(NR==2){ print $3 }')
	xsetroot -name " $Date   Vol:$Volum   Lang:$Lang   Memory:$FreeMem   "
	sleep 2
done
