#!/bin/bash

ICON_SOUND_0=
ICON_SOUND_1=
ICON_SOUND_2=

get_headphones() {
    system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null |
        jq -r '.SPBluetoothDataType[0].device_connected[] | to_entries[] | select(.value.device_minorType == "Headphones" or .value.device_minorType == "Headset") | .key'
}
HEADPHONES="$(get_headphones)"
if [ "$HEADPHONES" != "" ]; then
    sleep 3 # On `volume_change` event (which is triggered when disconnecting headphones), the Bluetooth info is not yet updated
    HEADPHONES="$(get_headphones)"
fi

if [ "$HEADPHONES" = "" ]; then
    if [ "$SENDER" = "volume_change" ]; then
        # The `volume_change` event supplies an `$INFO` variable in which the current volume percentage is passed to the script
        VOLUME=$INFO
        case "$VOLUME" in
        0)
            DRAWING=off
            ;;
        [1-9] | 1[0-9] | 20)
            DRAWING=on
            ICON=$ICON_SOUND_0
            ;;
        2[1-9] | [3-4][0-9] | 50)
            DRAWING=on
            ICON=$ICON_SOUND_1
            ;;
        *)
            DRAWING=on
            ICON=$ICON_SOUND_2
            ;;
        esac
        args=(
            icon="$ICON"
            drawing="$DRAWING"
        )
    else
        args=()
    fi
else
    args=(drawing=off)
fi

sketchybar --set "$NAME" "${args[@]}"
