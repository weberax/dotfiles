#!/bin/sh
# Toggle touchpad

tp_id=`xinput list | grep -i touchpad | awk '{ print $6 }' | sed 's/id=//'`

tp_enabled=`xinput list-props $tp_id | grep Device\ Enabled | awk '{ print $4 }'`

if [ $tp_enabled = 0 ]
then
  xinput set-prop $tp_id "Device Enabled" 1
  notify-send -t 1500 "Touchpad now on."
elif [ $tp_enabled = 1 ]
then
  xinput set-prop $tp_id "Device Enabled" 0
  notify-send -t 1500 "Touchpad now off."
else
  notify-send "touchpad_toggle: Could not get touchpad status from xinput."
  exit 1
fi
