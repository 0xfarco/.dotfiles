slstatus &
picom &
#xautolock -time 5 -locker slock &
xautolock -detectsleep -time 5 -locker slock -killtime 20 -killer "loginctl suspend" &
wmname LG3D &
feh --bg-scale ~/Pictures/wallpaper/arch1.png &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
exec dwm
