#!/bin/sh
picOpts="zoom"

curl -s -o ~/Wallpaper/wall.jpg -L https://unsplash.it/1920/1200/\?random

#Blur Image
convert ~/Wallpaper/wall.jpg -blur 160x80 ~/Wallpaper/wall.jpg

#Add overlay
composite -gravity Center ~/Wallpaper/overlay.png ~/Wallpaper/wall.jpg ~/Wallpaper/wallpaper.jpg

#Set Wallpaper
gsettings set org.gnome.desktop.background picture-uri '"file://'$HOME'/Wallpaper/wallpaper.jpg"'

gsettings set org.gnome.desktop.screensaver picture-uri '"file://'$HOME'/Wallpaper/wallpaper.jpg"'

#Cleanup
rm ~/Wallpaper/wall.jpg
