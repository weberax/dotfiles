#!/bin/bash
#a terminal clock
while true
do
	clear;
	date +"%H : %M : %S" | figlet;
	sleep 1;
done
