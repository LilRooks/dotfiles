[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xset b off
xset -dpms
xset s noblank
xset s off
xinput --disable 'AlpsPS/2 ALPS DualPoint TouchPad'
setxkbmap -variant mac -option 'caps:swapescape,compose:rctrl'

exec $@
