#!/usr/bin/env fish

switch $argv[1]

  case nvim
    kitty nvim ~/.cache/tmp-file

  case vim
    kitty vim ~/.cache/tmp-file

end
