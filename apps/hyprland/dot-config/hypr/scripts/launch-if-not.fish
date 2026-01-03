#!/usr/bin/env fish

if test (count $argv) -lt 1
  echo need at least one argument
  exit
end

set app $argv[1]

hyprctl clients | rg "class: $app"

if test $status -ne 0
  $app
end
