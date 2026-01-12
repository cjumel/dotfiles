#!/bin/bash

# This script takes as arguments:
# - the color to set the background if the battery is below or equal to 10%
# - the color to set the background if the battery is between 11% and 25%
# - the color to set the background if the battery is between 26% and 50%
# - the color to set the background if the battery is between 51% and 80% or if the battery is charging

ICON_BATTERY_0="󰂎"
ICON_BATTERY_1="󰁺"
ICON_BATTERY_2="󰁻"
ICON_BATTERY_3="󰁼"
ICON_BATTERY_4="󰁽"
ICON_BATTERY_5="󰁾"
ICON_BATTERY_6="󰁿"
ICON_BATTERY_7="󰂀"
ICON_BATTERY_8="󰂁"
ICON_BATTERY_9="󰂂"
ICON_BATTERY_10="󰁹"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
if [ "$PERCENTAGE" = "" ]; then
    exit 0
fi
CHARGING="$(pmset -g batt | grep 'AC Power')"

case "${PERCENTAGE}" in
[0-9])
    ICON=$ICON_BATTERY_0
    ;;
1[0-9])
    ICON=$ICON_BATTERY_1
    ;;
2[0-9])
    ICON=$ICON_BATTERY_2
    ;;
3[0-9])
    ICON=$ICON_BATTERY_3
    ;;
4[0-9])
    ICON=$ICON_BATTERY_4
    ;;
5[0-9])
    ICON=$ICON_BATTERY_5
    ;;
6[0-9])
    ICON=$ICON_BATTERY_6
    ;;
7[0-9])
    ICON=$ICON_BATTERY_7
    ;;
8[0-9])
    ICON=$ICON_BATTERY_8
    ;;
9[0-9])
    ICON=$ICON_BATTERY_9
    ;;
*)
    ICON=$ICON_BATTERY_10
    ;;
esac

case "${PERCENTAGE}" in
[0-9] | 10)
    DRAWING=on
    BACKGROUND_COLOR="$1"
    ;;
1[1-9] | 2[0-5])
    DRAWING=on
    BACKGROUND_COLOR="$2"
    ;;
2[6-9] | [3-4][0-9] | 50)
    DRAWING=on
    BACKGROUND_COLOR="$3"
    ;;
5[1-9] | [6-7][0-9] | 80)
    DRAWING=on
    BACKGROUND_COLOR="$4"
    ;;
*)
    DRAWING=off
    ;;
esac

if [[ "$CHARGING" != "" ]]; then
    ICON="$ICON󱐋"
    BACKGROUND_COLOR="$4"
fi

args=(
    drawing="$DRAWING"
    icon="$ICON"
    background.color="$BACKGROUND_COLOR"
)

sketchybar --set "$NAME" "${args[@]}"
