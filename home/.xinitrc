[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xset b off
xset -dpms
xset noblank
xset s off
xinput --disable 'AlpsPS/2 ALPS DualPoint TouchPad'
setxkbmap -variant mac -option 'caps:escape,shift:both_capslock_cancel,compose:rctrl'

exec i3
