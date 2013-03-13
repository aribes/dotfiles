#!/bin/sh


#
###########
#
echo "Installing zsh configuration"

if [ -e $HOME/.zshrc ];  then
    if [ -f $HOME/.zshrc ];  then
        echo "Saving old .zshrc file"
        mv $HOME/.zshrc $HOME/.zshrc-save
    else
        echo "Removing .zshrc file (should be a link)"
        rm $HOME/.zshrc
    fi
fi

# Get Script path
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

ln -s $SCRIPTPATH/zsh/zshrc $HOME/.zshrc
#
###########
#
