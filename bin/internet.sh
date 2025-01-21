#!/bin/bash


# Wifi
if [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'up' ] ; then
	wifiicon="$(awk '/^\s*w/ { print "🛜 ", int($3 * 100 / 70) "% " }' /proc/net/wireless)"
elif [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'down' ] ; then
	[ "$(cat /sys/class/net/w*/flags 2>/dev/null)" = '0x1003' ] && wifiicon="󰖪  " || wifiicon="󰖪 "
fi

# Ethernet
[ "$(cat /sys/class/net/e*/operstate 2>/dev/null)" = 'up' ] && ethericon="📶 " || ethericon="󰰰 "

# TUN
[ -n "$(cat /sys/class/net/tun*/operstate 2>/dev/null)" ] && tunicon=" 🔒"

printf "%s%s%s\n" "$wifiicon" "$ethericon" "$tunicon"
