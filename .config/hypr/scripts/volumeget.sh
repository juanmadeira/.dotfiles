#!/usr/bin/env sh

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volumepercent=$(awk '{printf("%d%%\n", 100 * $2)}' <<< "$volume")

case "$volume" in
    *MUTED*)
        mute="󰖁 mutado"
        volumemute="[$volumepercent]"
        notify-send "$mute $volumemute" -h string:x-canonical-private-synchronous:anything
        ;;
    *)
    mute="󰕾 volume:"
    notify-send "$mute $volumepercent" -h string:x-canonical-private-synchronous:anything
esac

