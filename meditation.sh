#!/bin/bash

# Ensure a base directory was provided.
FILE="${1:-mediations.json}"
COUNT="${2:-4}"

# get json blob
FILE_TEXT=$(<$FILE)
JQ_SELECTOR=".[]"
IFS=$'\n'
THIS_JSON=($( echo $FILE_TEXT | jq -c "$JQ_SELECTOR" | shuf -n $COUNT ))
for OUTPUT in ${THIS_JSON[@]}; do
    # echo "$OUTPUT"
    notify-send -u critical -t 0 'Meditation' "$OUTPUT"
done
notify-send -u critical -t 0 'Meditation' 'Reflect for a minute on todays desktop quote and how you can apply it in your life'

