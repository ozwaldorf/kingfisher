#!/bin/sh

called="$BASH_SOURCE"
if [ "$called" = "" ]; then
    called="$0"
fi
folder=$(dirname -- $(readlink -fn -- "$called"))

while true; do
    read -p "Are you in the location you would like to keep the script? (y/N)" yn

    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Please navigate there and restart the script"; exit;;
        * ) echo "Please navigate there and restart the script"; exit;;
    esac
done

#Hardcode the folder into the desktop file
processed_folder=$(echo $folder | sed -e 's/[\/&]/\\&/g')
sed -i 's/!!LOCATION!!/'$processed_folder'/' "$folder/Wallpaper.desktop"

cp "$folder/Wallpaper.desktop" ~/.config/autostart/Wallpaper.desktop
echo "Installation complete!"
rm install.sh
