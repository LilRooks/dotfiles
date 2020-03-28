#!/bin/bash
indexLocation="/tmp/playerIndex.${USER}"
script=~/.polybar-scripts/player-mpris-medium.sh

[ ! -f "$indexLocation" ] && player="1" || player="$(cat "$indexLocation")" # load player index
n="$(playerctl -l 2> /dev/null | wc -l)"
[[ "$player" -gt "$n" ]] && player="$n" # Correct if missing players
[[ "$player" -lt "1" ]] && player="1" # I'm pretty sure theres a case but not 100%

if [[ "$1" = "next" ]]; then # Change player
    player="$(( player + 1 ))"
    [[ "$player" -gt "$n" ]] && player="1" # loop forward
elif [[ "$1" = "prev" ]]; then
    player="$(( player - 1 ))"
    [[ "$player" -lt "1" ]] && player="$n" # loop back
elif [[ "$1" = "playerctl" ]]; then # Control player
    "$@" -p "$(playerctl -l | sed "${player}q;d")" # sed expects line number, not index
    exit
fi

echo "$player" > "$indexLocation"

[[ -n "$1" ]] && exit

# Set center icon
player_status="$($script playerctl status 2> /dev/null)"
if [ "$player_status" = "Playing" ]; then
    icon=""
elif [ "$player_status" = "Paused" ]; then
    icon=""
else
    echo "%{A4:$script next:}%{A5:$script prev:}No player found$($script playerctl metadata title 2> /dev/null)%{A}%{A}"
    exit
fi

# Grab metadata, artist and dash depend on artist existing
metadata="$($script playerctl metadata artist 2> /dev/null)"
[[ -n "$metadata" ]] && metadata="$metadata - "
metadata="%{A4:$script next:}%{A5:$script prev:}$metadata$($script playerctl metadata title 2> /dev/null)%{A}%{A}"

# Build controls
controls="%{A1:$script playerctl previous:}  %{A}"
controls="$controls%{A1:$script playerctl play-pause:} $icon %{A}"
controls="$controls%{A1:$script playerctl next:}  %{A}"
controls="%{A4:$script playerctl position 5+:}$controls%{A}"
controls="%{A5:$script playerctl position 5-:}$controls%{A}"
echo "$metadata $controls"

# echo "$metadata %{A4:$script playerctl position 5+:}%{A5:$script playerctl position 5-:}%{A1:$script playerctl previous:}  %{A}%{A1:$script playerctl play-pause:} $icon %{A}%{A1:$script playerctl next:}  %{A}%{A}%{A}"
