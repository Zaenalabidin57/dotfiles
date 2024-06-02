#!/bin/zsh

# Increase/decrease backlight with notification


if [ "$1" = "up" ]; then
 	brightnessctl s 30+
  notify-send --category=brightness --hint=int:transient:1 --hint=int:value:${$(brightnessctl g)} --hint=string:synchronous:brightness -i high-brightness "Brightness up 10 %" ""
 # notify-send --category=brightness "Current brightness: $(brightnessctl g)"
else
	if [ "$1" = "down" ]; then
 	  brightnessctl s 30-
    notify-send --category=brightness --hint=int:transient:1 --hint=int:value:${$(brightnessctl g)%.*} --hint=string:synchronous:brightness -i low-brightness "Brightness down 10 %" ""
	fi
fi
