#!/bin/sh

BLACK=0xff181926
LIGHT_GRAY=0xffb8c0e0

sketchybar \
    --add item clock right \
    --set clock \
    label.color="$BLACK" \
    background.height=25 \
    background.color=$LIGHT_GRAY \
    label.padding_left=5 \
    label.padding_right=5 \
    background.corner_radius=10 \
    script="$PLUGIN_DIR/clock.sh" \
    update_freq=5
