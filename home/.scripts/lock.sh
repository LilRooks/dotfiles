#!/bin/sh
TMPBG=/tmp/screen.png
LOCK=$HOME/.scripts/lock-smaller.png
# RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

# ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "scale=iw/15:ih/15,scale=15*iw:15*ih:flags=neighbor,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
grim - | ffmpeg -f png_pipe -i - -i $LOCK -filter_complex "scale=iw/15:ih/15,scale=15*iw:15*ih:flags=neighbor,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet

swaylock -i $TMPBG

rm $TMPBG
