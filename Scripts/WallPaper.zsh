#!/usr/bin/env bash
shopt -s nullglob

wallpapers=(~/.geta/WallPaper/*.jpg ~/.geta/Wallpaper/*.jpeg ~/.geta/Wallpaper/*.png ~/.geta/Wallpaper/*.gif)

if [ ${#wallpapers[@]} -eq 0 ]; then
  echo "No wallpapers found in ~/.geta/Wallpaper"
  notify-send "No wallpapers found in ~/.geta/Wallpaper/rei.png"
  exit 1
fi

wall="${wallpapers[RANDOM % ${#wallpapers[@]}]}"
pgrep -x swww-daemon >/dev/null || swww-daemon &
sleep 1
swww img "$wall" --transition-type any --transition-step 90 --transition-pos 0.5,0.5
