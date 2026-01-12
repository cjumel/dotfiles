#!/bin/bash

slack_settings=(
    icon=""
    icon.color="$BLACK"
    icon.padding_left=5
    icon.padding_right=3
    background.color="$LIGHT_BLUE"
    background.height=20
    background.corner_radius=10
    script="$PLUGIN_DIR/slack.sh"
    update_freq=5
)

sketchybar --add item slack right \
    --set slack "${slack_settings[@]}"
