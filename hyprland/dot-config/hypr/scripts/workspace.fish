#!/usr/bin/env fish

set current_workspace (hyprctl activeworkspace -j | jq -r ".id")

if test "$argv[2]" != $current_workspace
  hyprctl dispatch $argv[1] $argv[2]
else
  hyprctl dispatch $argv[1] previous
end
