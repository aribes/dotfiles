#!/bin/sh

# Where am I
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

mv $HOME/.vim $HOME/.vim-before
mv $HOME/.vimrc $HOME/.vimrc-before

ln -s $SCRIPTPATH/../vim $HOME/.vim
ln -s $SCRIPTPATH/../vim/vimrc $HOME/.vimrc
