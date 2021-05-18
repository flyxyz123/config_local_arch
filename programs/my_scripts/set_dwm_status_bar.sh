while true; do
	xsetroot -name "$(date "+%a %m/%d %H:%M") \
| $(cat /sys/class/net/wlp6s0/operstate) \
| $(if xset q | grep -q "Caps Lock: *on"; then echo A; else echo a; fi) \
| $(cat /sys/class/power_supply/BAT1/capacity)%"
	sleep 1
done
