#!/usr/bin/env fish

if test (count $argv) -ne 1
  echo "Usage: wallpaper.fish wallpaper_path"
  exit
end

set wp $argv[1]

ln -sf $wp ~/.wallpaper

# matugen image ~/.wallpaper -m $THEME # -t scheme-fruit-salad # -t scheme-expressive

# if test $THEME = "light"
#   wal -i $wp -l
# else
#   wal -i $wp
# end

notify-send -i $wp "Theme changed" "Wallpaper has been updated"
