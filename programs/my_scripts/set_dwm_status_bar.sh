while true; do
	xsetroot -name "$(date "+%a %m/%d %H:%M") \
| $(if xset q | grep -q "Caps Lock: *on"; then echo A; else echo a; fi) \
| $(cat /sys/class/net/wlp6s0/operstate) \
| $(free -h | awk '(NR==2){ print $4 }') \
| $(sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp) \
| $(cat /sys/class/power_supply/BAT1/capacity)%"
	sleep 1
done
