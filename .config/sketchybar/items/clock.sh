#!/bin/bash

clock_settings=(
    label.color="$BLACK"
    label.padding_left=5
    label.padding_right=5
    background.color="$LIGHT_BLUE"
    background.height=20
    background.corner_radius=10
    script="$PLUGIN_DIR/clock.sh"
    update_freq=10
)

sketchybar --add item clock right \
    --set clock "${clock_settings[@]}"
