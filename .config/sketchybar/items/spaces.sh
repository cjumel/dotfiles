#!/bin/bash

space_settings=(
    label.padding_left=3
    label.padding_right=10
    icon.font="$FONT:9.0"
    icon.padding_left=10
    background.color="$DARK_GRAY"
    background.height=28
    background.corner_radius=5
)

sketchybar --add event aerospace_workspace_change
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space."$sid" left \
        --subscribe space."$sid" aerospace_workspace_change \
        --set space."$sid" \
        label="$sid" \
        script="$PLUGIN_DIR/space.sh $sid $ORANGE $WHITE $LIGHT_BLUE" \
        click_script="aerospace workspace $sid" \
        "${space_settings[@]}"
done
