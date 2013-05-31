#!/bin/sh

# Where am I
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

echo "Installing powerline fonts"
cd $SCRIPTPATH
cd powerline-fonts
find . -name "*.ttf" -exec cp {} $HOME/.fonts \;
find . -name "*.otf" -exec cp {} $HOME/.fonts \;
fc-cache -vrf $HOME/.fonts
