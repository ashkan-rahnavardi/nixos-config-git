#!/usr/bin/env bash

echo ":: Theme Switcher"
hyprctl reload

# Define the variables
preload_path="~/Pictures/walls/dark/leaf.png"
wallpaper_setting="DP-4,~/Pictures/walls/dark/leaf.png"

if [[ "$1" == "leaf" ]]; then
hyprctl hyprpaper preload "~/Pictures/walls/dark/leaf.png"
hyprctl hyprpaper preload "~/Pictures/walls/dark/leaf2.png"
hyprctl hyprpaper preload "~/Pictures/walls/dark/leaf_vert.png"
hyprctl hyprpaper wallpaper "DP-4,~/Pictures/walls/dark/leaf2.png"
hyprctl hyprpaper wallpaper "DP-3,~/Pictures/walls/dark/leaf.png"
hyprctl hyprpaper wallpaper "DP-1,~/Pictures/walls/dark/leaf_vert.png"
fi


if [[ "$1" == "rice" ]]; then
hyprctl hyprpaper preload "~/Pictures/walls/rice/neon_car.png"
hyprctl hyprpaper preload "~/Pictures/walls/rice/purp_jap.png"
hyprctl hyprpaper preload "~/Pictures/walls/rice/city_vert.png"
hyprctl hyprpaper wallpaper "DP-4,~/Pictures/walls/rice/neon_car.png"
hyprctl hyprpaper wallpaper "DP-3,~/Pictures/walls/rice/purp_jap.png"
hyprctl hyprpaper wallpaper "DP-1,~/Pictures/walls/rice/city_vert.png"
fi 
