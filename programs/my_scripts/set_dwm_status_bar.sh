while true; do
	xsetroot -name "$(date "+%H:%M:%S %m/%d/%Y") | $(cat /sys/class/power_supply/BAT1/capacity)%"
	sleep 1
done
