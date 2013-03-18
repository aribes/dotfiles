#!/bin/sh

# Get Script path
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

echo "Installing the dotfiles directory"
if [ -e $HOME/.dotfilesdir ];  then
    rm $HOME/.dotfilesdir
fi
ln -s $SCRIPTPATH $HOME/.dotfilesdir

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

ln -s $SCRIPTPATH/zsh/zshrc $HOME/.zshrc
#
###########
#
