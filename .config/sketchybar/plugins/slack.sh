#!/bin/bash

BADGE=$(lsappinfo -all info -only StatusLabel Slack)

if [ -z "$BADGE" ] || [ "$BADGE" = '"StatusLabel"={ "label"="" }' ]; then
    DRAWING=off
else
    DRAWING=on
fi

sketchybar --set "$NAME" drawing="$DRAWING"
