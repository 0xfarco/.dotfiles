/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
slstatus &
picom &
#xautolock -time 5 -locker slock &
#xautolock -detectsleep -time 5 -locker slock -killtime 20 -killer "loginctl suspend" &
feh --bg-scale ~/Pictures/wallpaper/artix.png &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
exec dwm
