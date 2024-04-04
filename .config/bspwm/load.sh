#!/bin/sh

# killall dunst &
killall polybar
killall sxhkd 

picom --experimental-backend &
dunst & 
$HOME/.config/polybar/launch.sh &
sxhkd &

feh --bg-fill $HOME/Wallpapers/StarWars.jpg
