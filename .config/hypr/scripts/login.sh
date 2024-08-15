#!/usr/bin/env sh
# script to run wlogout if it's not already running

# check if wlogout is installed
if ! command -v wlogout &> /dev/null
then
    echo "wlogout could not be found. Please install it first."
    exit 1
fi

# check if wlogout is already running
if pgrep -x "wlogout" > /dev/null
then
    echo "wlogout is already running. Exiting."
    exit 1
else
    wlogout -b 3
fi

