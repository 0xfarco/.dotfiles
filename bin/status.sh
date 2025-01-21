#!/bin/sh

cpu () {
  top -bn1 | awk '/Cpu/ { print $2}'
}

temp () {
  sensors | awk '/Core 0/ {print "TEMP "  $3}'
}

disk () {
  df -h /home | awk ' /[0-9]/ {print "DISK " $3 "/" $2}'
}

mem () {
  free --mebi | sed -n '2{p;q}' | awk '{printf ("MEM %2.2fGiB/%2.2fGiB\n", ( $3 / 1024), ($2 / 1024))}'
}

battery () {
	~/.scripts/battery
}

wifi () {
	~/.scripts/wifi
}

timedate () {
	date '+%I:%M:%S %p'
}

clock () {
	date +"%d-%m-%Y %a %H:%M:%S"
}

lit () {
	brightnessctl | grep -oP '[^()]+%'
}

vol () {
	~/.scripts/vol
}

while :; do
	xsetroot -name "[$(battery)]  <<  $(wifi)  <<  LIT $(lit)  <<  VOL $(vol)  <<  $(temp)  <<  $(disk)  <<  $(mem)  <<  CPU $(cpu)  <<  $(clock) "
	sleep 1s
done
