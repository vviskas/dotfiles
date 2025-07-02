#!/bin/bash

# Define the path to your application list file
APPLIST_FILE="pkg_core.lst"

echo "Installing pkgs"

# Check if the app list file exists
if [ ! -f "$APPLIST_FILE" ]; then
    echo "Error: Application list file '$APPLIST_FILE' not found."
    echo "Please create it and populate it with application names (one per line)."
    exit 1
fi

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script needs to be run with root privileges for pacman."
    echo "Please run: sudo ./install_pkg.sh"
    exit 1
fi

echo "Updating pacman databases..."
pacman -Sy --noconfirm

while IFS= read -r app; do
    # Skip empty lines and lines starting with '#' (comments)
    if [[ -z "$app" || "$app" =~ ^# ]]; then
        continue
    fi

    echo "Attempting to install: $app"

    pacman -S "$app" --noconfirm --needed

    if [ $? -eq 0 ]; then
        echo "Successfully installed: $app"
    else
        echo "Failed to install: $app (See error messages above)"
    fi
    echo "-------------------------------------"
done < "$APPLIST_FILE"

echo "Application installation process completed."
