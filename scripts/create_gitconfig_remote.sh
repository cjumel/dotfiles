#!/usr/bin/env bash

# Copy the .gitconfig file (overwrite any existing file)
cp .gitconfig .gitconfig.remote

# Update the .gitconfig.remote file
if [ "$(uname)" == "Darwin" ]; then # Mac OS X
    gsed -i 's/\[credential\]//' .gitconfig.remote
    gsed -i 's/helper = osxkeychain//' .gitconfig.remote
    gsed -i 's/\[user\]//' .gitconfig.remote
    gsed -i 's/name = clementjumel//' .gitconfig.remote
    gsed -i 's/email = clement.jumel@gmail.com//' .gitconfig.remote
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then # GNU/Linux
    sed -i 's/\[credential\]//' .gitconfig.remote
    sed -i 's/helper = osxkeychain//' .gitconfig.remote
    sed -i 's/\[user\]//' .gitconfig.remote
    sed -i 's/name = clementjumel//' .gitconfig.remote
    sed -i 's/email = clement.jumel@gmail.com//' .gitconfig.remote
fi
