#!/bin/bash

FONTS=(
    "ttf-font-awesome"
    "ttf-dejavu"
    "noto-fonts-emoji"
    "ttf-jetbrains-mono-nerd"
    "ttf-firacode-nerd"
    "ttf-adwaita-mono-nerd"
    "ttf-firacode-nerd"
    "ttf-meslo-nerd"
)

echo "Font instalation..."

for font in "${FONTS[@]}"; do
    echo "---------------------------"
    echo "Attempting to isntall: $font"

    echo "Trying pacman..."

    sudo pacman -S --noconfirm "$font"

    if [ $? -eq 0 ]; then
        echo "Succesfully installed $font with pacman."
    else
        echo "Trying to install with yay."

        yay -S --noconfirm "$font"

        if [ $? -eq 0 ]; then
            echo "Succesfully installed $font with yay."
        else
            echo "FAILED to install $font with pacman and yay."
        fi
    fi
done

echo "------------------------"
echo "Fonts installation complited."
echo " "
echo "Rebuilding cache:"

sudo fc-cache -fv
