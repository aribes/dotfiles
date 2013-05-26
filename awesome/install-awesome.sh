#!/bin/sh

echo "Creating .xinitrc/.xsession"

if [ -e $HOME/.xinitrc ];  then
    if [ -f $HOME/.xinitrc ];  then
        echo "Saving old .xinitrc file"
        mv $HOME/.xinitrc $HOME/.xinitrc-save
    fi
fi

if [ -h $HOME/.xinitrc ];  then
    echo "Removing .xinitrc link"
    rm $HOME/.xinitrc
fi

if [ -e $HOME/.xsession ];  then
    if [ -f $HOME/.xsession ];  then
        echo "Saving old .xsession file"
        mv $HOME/.xsession $HOME/.xsession-save
    fi
fi

if [ -h $HOME/.xsession ];  then
    echo "Removing .xsession link"
    rm $HOME/.xsession
fi

touch $HOME/.xinitrc
echo "#!/bin/sh" >> $HOME/.xinitrc
echo exec $HOME/.awesome-install >> $HOME/.xinitrc
ln -s $HOME/.xinitrc $HOME/.xsession

echo "Installing Awesome configuration file"
if [ -e $HOME/.config/awesome/rc.lua ];  then
    if [ -f $HOME/.config/awesome/rc.lua ];  then
        echo "Saving old rc.lua file"
        mv $HOME/.config/awesome/rc.lua $HOME/.config/awesome/rc.lua-save
    fi
fi

if [ -h $HOME/.config/awesome/rc.lua ];  then
    echo "Removing rc.lua link"
    rm $HOME/.config/awesome/rc.lua
fi

ln -s $HOME/.dotfilesdir/awesome/rc.lua $HOME/.config/awesome/rc.lua
