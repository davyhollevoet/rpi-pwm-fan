#!/bin/bash

T=30
O="$1"
if [ -z "$O" ]; then
	echo Specify an output file
	exit 1
fi

F=.measuring
trap "rm -f $F" EXIT
touch "$F"

(
	while [ -f "$F" ]; do
		cat /sys/devices/virtual/thermal/thermal_zone0/temp /sys/devices/virtual/thermal/cooling_device0/cur_state | paste -sd "," -
		sleep 0.25
	done | tee "$O"
	echo Done
) &

sleep 5
timeout $T ./cpuburn-a53
sleep $T
rm "$F"
sleep 1

