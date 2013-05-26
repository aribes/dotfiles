#!/bin/sh

# Where am I
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

# Update or init submodules
cd $SCRIPTPATH/..
git submodule init
git submodule update

cd $SCRIPTPATH/repo

# Cleaning and getting last version
git clean -f
git pull

# Creating build directory
cd $SCRIPTPATH
rm -rf repo-build
mkdir repo-build
cd repo-build
cmake -G Ninja ../repo -DCMAKE_INSTALL_PREFIX=$HOME/.awesome-install
cninja
cninja install
