#!/bin/sh

# Where am I
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

cd $HOME
rm -rf .config/powerline
ln -s $SCRIPTPATH/config-files $HOME/.config/powerline

