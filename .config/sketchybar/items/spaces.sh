#!/usr/bin/env sh

sketchybar --add event aerospace_workspace_change
for sid in $(aerospace list-workspaces --all); do
    sketchybar \
        --add item space."$sid" left \
        --subscribe space."$sid" aerospace_workspace_change \
        --set space."$sid" \
        label="$sid" \
        background.height=25 \
        label.padding_left=10 \
        label.padding_right=10 \
        background.corner_radius=5 \
        script="$PLUGIN_DIR/aerospace.sh $sid" \
        click_script="aerospace workspace $sid"
done
