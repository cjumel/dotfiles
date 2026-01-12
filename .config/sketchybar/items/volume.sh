#!/bin/bash

volume_settings=(
    icon.color="$BLACK"
    icon.padding_left=5
    icon.padding_right=5
    background.color="$LIGHT_BLUE"
    background.height=20
    background.corner_radius=10
    script="$PLUGIN_DIR/volume.sh"
)

sketchybar --add item volume right \
    --add event bluetooth_change "com.apple.bluetooth.status" \
    --subscribe volume volume_change bluetooth_change \
    --set volume "${volume_settings[@]}"
