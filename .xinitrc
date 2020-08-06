#!/bin/sh

keynav &

xwallpaper --center "$HOME/git/wallpapers/Red moon.jpg" &

sxhkd &

xrdb -merge ~/.Xresources

xsetroot -name " Reminder: Install Scratch buffer plugin and colorizer plugin for NeoVim. "

exec dwm
