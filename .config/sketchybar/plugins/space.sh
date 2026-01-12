#!/bin/bash

# This script takes as arguments:
# - the id of the current AeroSpace workspace
# - the color to set the label and icon if the workspace is focused
# - the color to set the label and icon if the workspace is unfocused and has windows
# - the color to set the label and icon if the workspace is unfocused and has no windows

ICON_FOCUSED=""
ICON_PREV=""
ICON_UNFOCUSED=""

# On startup, `FOCUSED_WORKSPACE` is not set
if [ -z "$FOCUSED_WORKSPACE" ]; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

HAS_WINDOWS=$(aerospace list-windows --workspace "$1" 2>/dev/null | head -1)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    ICON="$ICON_FOCUSED"
    COLOR="$2"
else
    if [ "$1" = "$PREV_WORKSPACE" ]; then
        ICON="$ICON_PREV"
    else
        ICON="$ICON_UNFOCUSED"
    fi
    if [ "$HAS_WINDOWS" ]; then
        COLOR="$3"
    else
        COLOR="$4"
    fi
fi
args=(
    icon="$ICON"
    label.color="$COLOR"
    icon.color="$COLOR"
)

sketchybar --set "$NAME" "${args[@]}"
