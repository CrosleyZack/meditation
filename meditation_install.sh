#!/bin/bash

FILE_PATH=$(realpath $BASH_SOURCE)
# echo "FILE_PATH = $FILE_PATH"
DIR_PATH=$(dirname $FILE_PATH)
# echo "DIR_PATH = $DIR_PATH"

# Create startup.desktop
DESKTOP_FILE="$DIR_PATH/mediation.desktop"
rm -f $DESKTOP_FILE
echo "[Desktop Entry]
Type=Application
Name=MediationScript
Exec=$DIR_PATH/mediation.sh
OnlyShowIn=GNOME;" > $DESKTOP_FILE

# link to generated startup script.
mkdir -p $HOME/.config/autostart
rm -f $HOME/.config/autostart/meditation.desktop
ln -s $DESKTOP_FILE $HOME/.config/autostart/meditation.desktop
