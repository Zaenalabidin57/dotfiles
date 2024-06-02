#!/bin/zsh

# Configure Volume with notification

if [ "$1" = "vol" ]; then
    if [ "$2" = "mute"  ]; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
    elif [ "$(pactl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')" != "[MUTED]" ]; then
        if [ "$2" = "up" ]; then
            pactl set-sink-volume @DEFAULT_SINK@ +2%
        elif [ "$2" = "down" ]; then
          pactl set-sink-volume @DEFAULT_SINK@ -2%
        fi
    fi

    VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
    VOL_STRING="${VOL}%"
    if [ "$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $3}')" = "[MUTED]" ]; then
        if [ "$2" = "mute"  ]; then
            notify-send --category=volume --hint=string:synchronous:volume -i audio-volume-muted "MUTED" ""
        else
            notify-send --category=volume --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-muted "MUTED" ""
        fi
    elif [[ $VOL < 34 ]]; then
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-low "${VOL_STRING}" ""
    elif [[ $VOL < 67 ]]; then
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-medium "${VOL_STRING}" ""
    else
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-high "${VOL_STRING}" ""
    fi

elif [ "$1" = "mic" ]; then
    pactl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

    MIC_VOL=$(pactl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2*100}')
    if [ "$(pactl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')" = "[MUTED]" ]; then
        notify-send --category=volume --hint=string:synchronous:volume -i mic-off "MIC OFF" ""
    else
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$MIC_VOL --hint=string:synchronous:volume -i mic-on "MIC ON" ""
    fi
fi

