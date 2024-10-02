#!/bin/bash

if [ -z "$1" ]; then
	echo "Please Provide a valid Path to an Image"
	exit 1
fi

IMAGE_PATH="$1"
HYPR_PAPER_CONF="/home/lasha/.config/hypr/hyprpaper.conf"

wal -i "$IMAGE_PATH"

echo "splash = false" > "$HYPR_PAPER_CONF"

echo "preload = $IMAGE_PATH" >> "$HYPR_PAPER_CONF" 

echo "wallpaper = HDMI-A-3,$IMAGE_PATH" >> "$HYPR_PAPER_CONF" 
