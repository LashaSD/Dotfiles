#!/bin/sh

killall waybar
killall hyprpaper

exec waybar -c ~/.config/waybar/config | hyprpaper 
