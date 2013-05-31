#!/bin/sh

# Where am I
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

echo "Installing libgit2"
cd $SCRIPTPATH
cd libgit2
git reset --hard
git checkout v0.18.0
cd ..
rm -rf libgit2-build
mkdir libgit2-build
cd libgit2-build
cmake ../libgit2 -DCMAKE_INSTALL_PREFIX=$HOME/.install
make
make install

echo "Installing pygit2"
cd $SCRIPTPATH
export LIBGIT2=$HOME/.install
export LDFLAGS="-Wl,-rpath='$LIBGIT2/lib',--enable-new-dtags $LDFLAGS"
cd pygit2
git reset --hard
python setup.py build
python setup.py install --user
python setup.py test
#pip install pygit2 --upgrade --user
#rm -rf pygit2-build
#pip install -b $SCRIPTPATH/pygit2-build -I --no-install pygit2
#cd pygit2-build/pygit2
#python setup.py build_ext --include-dirs=/home/andre/.install/include

echo "Installing psutil"
pip install psutil --upgrade --user

echo "Installing powerline"
pip install --user --upgrade $SCRIPTPATH/powerline
