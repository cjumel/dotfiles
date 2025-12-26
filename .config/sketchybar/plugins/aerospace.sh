#!/usr/bin/env sh

GRAY_0=0xff3c3e4f
GRAY_1=0xff494d64
GRAY_2=0xff888888
ORANGE=0xfff5a97f
WHITE=0xffffffff

# On startup, `FOCUSED_WORKSPACE` is not set, so get it from aerospace
if [ -z "$FOCUSED_WORKSPACE" ]; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

HAS_WINDOWS=$(aerospace list-windows --workspace "$1" 2>/dev/null | head -1)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" label.color=$ORANGE background.color=$GRAY_1
elif [ -z "$HAS_WINDOWS" ]; then
    sketchybar --set "$NAME" label.color=$GRAY_2 background.color=$GRAY_0
else
    sketchybar --set "$NAME" label.color=$WHITE background.color=$GRAY_0
fi
