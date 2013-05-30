#!/bin/sh

# Where am I
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

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
echo exec ck-launch-session dbus-launch --sh-syntax --exit-with-session $HOME/.install/bin/awesome >> $HOME/.xinitrc
ln -s $HOME/.xinitrc $HOME/.xsession

echo "Installing Awesome configuration file"
rm -rf $HOME/.config/awesome
ln -s $SCRIPTPATH/config-awesome-3.5/ $HOME/.config/awesome
