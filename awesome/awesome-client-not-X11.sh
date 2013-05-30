#!/bin/bash 
if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]]; then # Looks like we are outside X
    dbus_file=$(ls $HOME/.dbus/session-bus/ -t1 | head -1) # Get the latest file in session-bus directory
    . "$HOME/.dbus/session-bus/$dbus_file" && export DBUS_SESSION_BUS_ADDRESS # and export a variable from it
fi
$HOME/.install/bin/awesome-client-bin
