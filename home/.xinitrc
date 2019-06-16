[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xset b off
xset -dpms
xset s noblank
xset s off
xinput --disable 'AlpsPS/2 ALPS DualPoint TouchPad'
setxkbmap -variant mac -option 'caps:swapescape,compose:rctrl'

udiskie --tray

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
