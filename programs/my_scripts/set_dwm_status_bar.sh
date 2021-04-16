while true; do
	xsetroot -name "$(date "+%a %m/%d/%Y %H:%M:%S") | $(cat /sys/class/power_supply/BAT1/capacity)%"
	sleep 1
done
