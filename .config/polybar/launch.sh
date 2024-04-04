#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar &

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Launch the bar
polybar -c $HOME/.config/polybar/Config.ini bspwm &
polybar -c $HOME/.config/polybar/Config.ini xwindow &
polybar -c $HOME/.config/polybar/Config.ini network &
polybar -c $HOME/.config/polybar/Config.ini pulseaudio &
polybar -c $HOME/.config/polybar/Config.ini keyboard &
polybar -c $HOME/.config/polybar/Config.ini powermenu &
polybar -c $HOME/.config/polybar/Config.ini nightlight &
polybar -c $HOME/.config/polybar/Config.ini date &
