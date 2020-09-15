export GDK_BACKEND=x11
export QT_QPA_PLATFORM=xcb

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#xset b off
#xset -dpms
#xset s noblank
#xset s off
#xinput --disable 'AlpsPS/2 ALPS DualPoint TouchPad'
#setxkbmap -variant mac -option 'caps:swapescape,compose:rctrl'

exec $@
