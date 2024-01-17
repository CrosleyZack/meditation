#!/bin/bash

# sudo apt-get install -y libnotify-bin

FILE_PATH=$(realpath $BASH_SOURCE)
# echo "FILE_PATH = $FILE_PATH"
DIR_PATH=$(dirname $FILE_PATH)
# echo "DIR_PATH = $DIR_PATH"

# Create startup.desktop
DESKTOP_FILE="$DIR_PATH/meditation.desktop"
rm -f $DESKTOP_FILE
echo "[Desktop Entry]
Type=Application
Name=MediationScript
Exec=$DIR_PATH/meditation.sh
OnlyShowIn=GNOME;" > $DESKTOP_FILE

# link to generated startup script.
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p $XDG_CONFIG_HOME/autostart
rm -f $XDG_CONFIG_HOME/autostart/meditation.desktop
ln -s $DESKTOP_FILE $XDG_CONFIG_HOME/autostart/meditation.desktop
echo "stoic meditation installed"
