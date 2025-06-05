#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/wireplumber &
dwmblocks &
picom &
#xautolock -time 5 -locker slock &
#xautolock -detectsleep -time 5 -locker slock -killtime 20 -killer "loginctl suspend" &
feh --bg-scale ~/Pictures/wallpaper/pixel1.png &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
exec dwm
