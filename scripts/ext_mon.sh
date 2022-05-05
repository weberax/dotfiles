#!/bin/bash

EXTERNAL="HDMI-1"
INTERNAL="eDP-1"

function ExternalConnected {
	! xrandr | grep $EXTERNAL | grep -q disconnected
}

function ActivateHDMI {
	xrandr --output $EXTERNAL --auto --below $INTERNAL
	xrandr --output $INTERNAL --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output $EXTERNAL --mode 1366x768 --pos 1920x1080 --rotate normal
	notify-send -t 1500 "External monitor toggled on."
}

function DeactivateHDMI {	
	xrandr --output $EXTERNAL --off
	notify-send -t 1500 "External monitor toggled off."
}	


for i in {0..10}
do
	notify-send -t 1255 "Looking for external monitor."	
	if ExternalConnected 
	then
		ActivateHDMI
		trap 'DeactivateHDMI;exit 0' 1 2 3 15
		while true
		do
			if ! ExternalConnected
			then
				DeactivateHDMI
				exit 0
			fi
			sleep 5s
		done
	fi
	sleep 1s
done
notify-send -t 4000 "Could not find external monitor."
exit 1
