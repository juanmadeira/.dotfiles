#!/bin/bash

# this script installs all fonts from the current directory on arch linux
# https://github.com/miguelgargallo/install-arch-fonts

# check if user is running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# get the current working directory
font_folder=$(pwd)

# check if the folder exists
if [ ! -d "$font_folder" ]; then
    echo "The current working directory does not exist"
    exit 1
fi

# copy all fonts to the system fonts folder
cp -r $font_folder/*.otf /usr/share/fonts/

# update font cache
fc-cache -f -v

echo "All fonts have been successfully installed."
