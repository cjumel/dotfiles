#!/usr/bin/env bash

# Copy the tmux.conf file (overwrite any existing file)
cp .config/tmux/tmux.conf .config/tmux/tmux.conf.light

# Update the tmux.conf.light file theme
if [ "$(uname)" == "Darwin" ]; then # Mac OS X
    gsed -i 's/mocha/latte/' .config/tmux/tmux.conf.light
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then # GNU/Linux
    sed -i 's/mocha/latte/' .config/tmux/tmux.conf.light
fi
