#!/bin/bash




while true; do

	kjemi=13
	fys=21
	datakom=1
	matte=5
	cpp=6
	
	NowDay=10#`date +"%d"`
	NowM=$(date +"%m")
	

	let kjemi=$kjemi-$NowDay
	let fys=$fys-$NowDay
	let datakom=31+$datakom-$NowDay
	let matte=31+$matte-$NowDay
	let cpp=32+$cpp-$NowDay

	Date=$(date +"%A %d-%m-%y %H:%M")
	Volum=$(amixer get Master | awk -F'[][]' 'END{ print $2 }')
	Lang=$(setxkbmap -query | awk '/layout/{ print $2 }')
	FreeMem=$(free -h | awk '(NR==2){ print $3 }')
	xsetroot -name "k:$kjemi f:$fys d:$datakom m:$matte c:$cpp $Date   Vol:$Volum   Lang:$Lang   Memory:$FreeMem   "
	sleep 2
done
