#!/bin/bash

battery_settings=(
    icon.color="$BLACK"
    icon.padding_left=5
    icon.padding_right=5
    background.height=20
    background.corner_radius=10
    script="$PLUGIN_DIR/battery.sh $RED $ORANGE $YELLOW $LIGHT_BLUE"
    update_freq=60
)

sketchybar --add item battery right \
    --subscribe battery system_woke power_source_change \
    --set battery "${battery_settings[@]}"
