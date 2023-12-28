#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
#exec polybar -c $HOME/.config/polybar/configJohn.ini
exec polybar -c $HOME/.config/polybar/configNeon.ini
#exec polybar -c $HOME/.config/polybar/configNeonPurple.ini
#exec polybar -c $HOME/.config/polybar/configCatpucc.ini

