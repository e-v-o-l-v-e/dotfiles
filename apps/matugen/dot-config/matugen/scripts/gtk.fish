#!/usr/bin/env fish

set mode (string lower $argv[1])

dconf write /org/gnome/desktop/interface/color-scheme "'prefer-$mode'"
