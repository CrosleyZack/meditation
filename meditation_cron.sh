#!/bin/bash

# How often to run
HOUR=$1
if [ -z "$HOUR" ]
then
    HOUR=$((1 + $RANDOM % 5))
fi
# TODO remove
HOUR=01

# Get executable to run
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "mediatation_cron SCRIPT_DIR = $SCRIPT_DIR"
logger "meditation_cron SCRIPT_DIR = $SCRIPT_DIR"
EXE="$SCRIPT_DIR/meditation.sh"

# run meditation script
bash $EXE

# Add new cronjob if doesn't already exist
# sh crontab -e
crontab -l > crontab_new
found=$( grep $EXE crontab_new )
if [ -z "$found" ]
then
    echo "meditation_cron adding cron to crontab"
    logger "meditation_cron adding cron to crontab"
    # TODO swap
    # echo "00 $HOUR * * * $EXE" >> crontab_new
    echo "$HOUR 0 * * * $EXE" >> crontab_new
fi
crontab crontab_new
rm crontab_new
