#!/bin/bash
logger "meditation.sh: Running"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
EXE="$SCRIPT_DIR/meditations.json"

FILE=$1
if [ -z $FILE ]
then
    FILE=$EXE
fi
COUNT="${2:-4}"

# get json blob
logger "meditation.sh: reading file $FILE"
FILE_TEXT=$(<$FILE)
JQ_SELECTOR=".[]"
IFS=$'\n'
THIS_JSON=($( echo $FILE_TEXT | jq -c "$JQ_SELECTOR" | shuf -n $COUNT ))

# send notifications
logger "meditation.sh: Sending meditations $THIS_JSON"
for OUTPUT in ${THIS_JSON[@]}; do
    notify-send -u critical -t 0 'Meditation' "$OUTPUT"
done
notify-send -u critical -t 0 'Meditation' 'Reflect for a minute on todays desktop quote and how you can apply it in your life'

logger "meditation.sh: Complete"
