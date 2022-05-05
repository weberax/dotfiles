#!/bin/sh
# light dark toggle
# Xresources and vim

# actual theme
theme=`readlink ~/.config/Xresources/current_colors`

# determine new theme
if [ $theme == "dark" ]; then
  new_theme="light"
elif [ $theme == "light" ]; then
  new_theme="dark"
else
  echo "not working" && exit 1
fi

# urvxt
ln -sf $new_theme ~/.config/Xresources/current_colors
xrdb ~/.Xresources

# vim
echo "set background=$new_theme" > ~/.config/nvim/vim.color

notify-send -t 1500 "toggled to $new_theme"
