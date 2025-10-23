#!/usr/bin/env fish

if test (count $argv) -ne 1
  echo "Usage: monitors.fish [mode]"
  echo "With mode one of 'mirror' or 'extended'"
  exit
end

set mode $argv[1]

ln -sf ~/.config/hypr/land/monitors{-$mode,}.conf
