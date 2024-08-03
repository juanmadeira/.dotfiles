#!/bin/bash
# script to run clipse if it's not already running

# check if clipse is installed
if ! command -v clipse &> /dev/null
then
    echo "clipse could not be found. Please install it first."
    exit 1
fi

# check if clipse is already running
if pgrep -x "clipse" > /dev/null
then
    echo "clipse is already running. Exiting."
    exit 1
else
    kitty --class clipse -e 'clipse'
fi

